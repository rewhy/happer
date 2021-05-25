#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "TransformOpcode2Vex.h"

#include "../libvex_basictypes.h"
#include "../libvex_ir.h"
#include "../libvex.h"
#include "../main_util.h"

__attribute__ ((noreturn)) void failure_exit (void) {
    fprintf(stdout, "VEX did failure_exit. Bye.\n");
    exit(1);
}

void log_bytes(const HChar* bytes, SizeT nbytes) {
    fwrite(bytes, 1, nbytes, stdout);
}

Bool chase_into_not_ok(void* opaque, Addr dst) {
    return False;
}

UInt needs_self_check(void* closureV, VexRegisterUpdates* pxControl, const VexGuestExtents* vge) {
    return 0;
}

/* global variable */
Bool init_done = False;
VexControl vcon;

void init() {
    LibVEX_default_VexControl(&vcon);
    vcon.iropt_level = 0;
    vcon.guest_max_insns = 60;

    LibVEX_Init(&failure_exit, &log_bytes, 1, /* debug_paranoia */ &vcon);

    init_done = True;
}

// int main(int argc, char **argv) {
JNIEXPORT jint JNICALL Java_hk_polyu_trace_analysis_TransformOpcode2Vex_generateIR(JNIEnv* env, jobject thiz, jlong ip, jlongArray binary) {
    if (init_done != True) {
        init();
    }

    Int trans_used;
    Int N_TRANSBUF = 5000;
    UChar transbuf[N_TRANSBUF];

    VexTranslateResult tres;
    IRSB* irsb;

    VexGuestExtents vge;
    VexArchInfo vai_arm64;
    VexAbiInfo vbi;
    VexTranslateArgs vta;

    jlong* opcodes = (*env)->GetLongArrayElements(env, binary, 0);

    {
        // initialization
        irsb = NULL;
        memset(transbuf, 0, N_TRANSBUF);
        memset(&tres, 0, sizeof(VexTranslateResult));

        // for VGA_arm64
        LibVEX_default_VexArchInfo(&vai_arm64);
        vai_arm64.endness = VexEndnessLE;
        vai_arm64.arm64_dMinLine_lg2_szB = 6;
        vai_arm64.arm64_iMinLine_lg2_szB = 6;

        LibVEX_default_VexAbiInfo(&vbi);
        vbi.guest_stack_redzone_size = 128;

        /* ----- Set up args for LibVEX_Translate ----- */

        vta.abiinfo_both = vbi;
        // vta.guest_bytes = (*env)->GetLongArrayElements(env, binary, 0); // the basic block that is required to be translated
        // vta.guest_bytes_addr = ip; // the virtual address of the basic block
        vta.callback_opaque = NULL;
        vta.chase_into_ok = chase_into_not_ok;
        vta.guest_extents = &vge;
        vta.host_bytes = transbuf; // a place to store the translation result
        vta.host_bytes_size = N_TRANSBUF; // the size of the preserved place
        vta.host_bytes_used = &trans_used; // the actual size of the translation result

        /* arm64 -> arm64 */
        vta.arch_guest = VexArchARM64;
        vta.archinfo_guest = vai_arm64;
        vta.arch_host = VexArchARM64;
        vta.archinfo_host = vai_arm64;

        /* no instrumentation */
        vta.instrument1 = NULL;
        vta.instrument2 = NULL;
        vta.needs_self_check = needs_self_check;
        vta.preamble_function = NULL;
        // vta.traceflags = (1 << 7) | (1 << 6) | (1 << 5) | (1 << 4) | (1 << 3) | (1 << 2) | (1 << 1) | 1;
        vta.traceflags = 0;
        vta.addProfInc = False;
        vta.sigill_diag = True;

        vta.guest_bytes = opcodes; // the basic block that is required to be translated
        vta.guest_bytes_addr = ip; // the virtual address of the basic block

        vta.disp_cp_chain_me_to_slowEP = (void*) 0x12345678;
        vta.disp_cp_chain_me_to_fastEP = (void*) 0x12345679;
        vta.disp_cp_xindir = (void*) 0x1234567A;
        vta.disp_cp_xassisted = (void*) 0x1234567B;

        vta.finaltidy = NULL;
    }

    {    
        irsb = LibVEX_Translate_PolyU(&vta, &tres);

        if (tres.status != VexTransOK)
            printf("\ntres = %d\n", (Int) tres.status);
        
        assert(tres.status == VexTransOK);
        assert(tres.n_sc_extents == 0);
        assert(vge.n_used == 1);

        // ppIRSB(irsb);
        // printf("%x\n", tres.n_guest_instrs);
    }

    // printf("\n");
    // LibVEX_ShowAllocStats();

    // release memory
    (*env)->ReleaseLongArrayElements(env, binary, opcodes, 0);

    UInt consumedInstructionCount = tres.n_guest_instrs;

    return consumedInstructionCount;
}