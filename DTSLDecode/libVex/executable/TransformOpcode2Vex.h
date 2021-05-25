#ifndef __TRANSFORMOPCODE2VEX_H
#define __TRANSFORMOPCODE2VEX_H

#include <jni.h>

JNIEXPORT jint JNICALL Java_hk_polyu_trace_analysis_TransformOpcode2Vex_generateIR(JNIEnv*, jobject, jlong, jlongArray);

#endif