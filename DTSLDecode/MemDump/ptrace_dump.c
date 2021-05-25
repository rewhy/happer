#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdarg.h>
#include <sys/ptrace.h>

int main(int argc, char **argv) {

    if (argc == 5 || argc == 6) {
        int pid = atoi(argv[2]);
        int number;

        ptrace(PTRACE_ATTACH, pid, NULL, NULL);
        wait(NULL);

        char option[20];
        sscanf(argv[1], "%20s", option);
        unsigned long long start_address;
        sscanf(argv[3], "0x%llx", (unsigned long long*) &start_address);
        int total_bytes;
        sscanf(argv[4], "0x%x", (int*) &total_bytes);
        char* search_string = NULL;
        if(argc == 6) {
            search_string = (char*) malloc(strlen(argv[5]));
            sscanf(argv[5], "%s", search_string);
        }
        
        dump_memory(pid, start_address, total_bytes, option, search_string);
        ptrace(PTRACE_CONT, pid, NULL, NULL);
        ptrace(PTRACE_DETACH, pid, NULL, NULL);
    } else {
	    printf("%s <dump|show|search> <pid> <start_address> <total_bytes> [search string] \nwhere <start_address, total_bytes> is in hexadecimal (remember the \"0x\" in front is needed - by sscanf()\n", argv[0]);
	    exit(0);
    }
}

void my_printf(bool enable, char* format, ...) {
    if(enable == true) {
        va_list args;
        va_start(args, format);
        vprintf(format, args);
        va_end(args);
    }
}

dump_memory(int pid, unsigned long long start_address, int total_bytes, char* option, char* search_string) {
	
	unsigned long long address;

	unsigned int number = 0;
    char character;
    char ascii[17];
    char* dump_buffer;
    
    bool dump_flag = false;
    bool show_flag = false;
    bool search_flag = false;
    
    bool search_start = false;
    int search_string_index = 0;
    bool unicode_flag = false;
    unsigned long long string_address = 0;
    int search_string_length;
    bool search_string_found = false;
    
    if (!strcmp(option, "dump")) {
        dump_flag = true;
        dump_buffer = malloc(total_bytes);
    }

    if (!strcmp(option, "show")) {
        show_flag = true;
    }

    if (!strcmp(option, "search")) {
        search_flag = true;
        search_string_length = strlen(search_string);
    }

    ascii[16] = 0;
    my_printf(show_flag, "\n\nData dumped from 0x%llx to 0x%llx : \n\n", start_address, start_address + total_bytes);
    
	for (address = start_address; address < start_address + total_bytes; address++) {
        number = ptrace(PTRACE_PEEKDATA, pid, (void*) address, (void*) number);
        character = number % 0x100;
        
        if (show_flag) {
            if (address % 16 == 0)
                my_printf(show_flag, "0x%llx : ", address);
            
            if (character >= 0x20 && character <= 0x7E)
                ascii[address%16] = (char) character;
            else
                ascii[address%16] = '.';

            my_printf(show_flag, "%02x ", number % 0x100);
            
            if ((address + 1) % 16 == 0)
                my_printf(show_flag, "    %s\n", ascii);
        }

        if (dump_flag)
            dump_buffer[address - start_address] = character;
        
        if (search_flag) {
            if (address % 0x1000000 == 0){
                printf("Searching... 0x%llx\n", address);
            }

            if (character == search_string[0] && search_start == false){
                char next_character = ((number % 0x10000) - (number % 0x100)) >> 8;
                char next_next_character = ((number % 0x1000000) - (number % 0x10000)) >> 16;
                if (next_character == search_string[1]) {
                    unicode_flag = false;
                } else if ((next_character == '\x00') && (next_next_character == search_string[1])) {
                    unicode_flag = true;
                }
                search_start = true;
                string_address = address;
                search_string_index = 1;
                continue;
            }
            
            if (search_start == true) {
                if (unicode_flag == false) {
                    if (character == search_string[search_string_index]) {
                        search_string_index++;
                        if (search_string_index == search_string_length) {
                            printf("ASCII string found at address : 0x%llx\n\n", string_address);
                            start_address = string_address - (string_address % 0x100);
                            search_string_found = true;
                            break;
                        } else {
                            continue;
                        }
                    } else {
                        search_start = false;
                        unicode_flag = false;
                        search_string_index = 0;
                        string_address = 0;
                        continue;
                    }
                } else {
                    if ((address - string_address) % 2 == 0) {
                        if (character == search_string[search_string_index]) {
                            search_string_index++;
                            if (search_string_index == search_string_length) {
                                printf("UNICODE string found at address : 0x%llx\n\n", string_address);
                                start_address = string_address - (string_address % 0x100);
                                search_string_found = true;
                                break;
                            } else {
                                continue;
                            }
                        } else {
                            search_start = false;
                            unicode_flag = false;
                            search_string_index = 0;
                            string_address = 0;
                            continue;
                        }
                    } else{
                        if (character != '\x00') {
                            search_start = false;
                            unicode_flag = false;
                            search_string_index = 0;
                            string_address = 0;
                            continue;
                        }
                    }
                }
            }
        }
	}

	if (total_bytes==0) {
        number = ptrace(PTRACE_PEEKDATA, pid, (void*) start_address, (void*) number);
        my_printf(show_flag, "Peek at 0x%llx: %x\n", (unsigned long long) start_address, number);
	}
    
    if (dump_flag) {
        FILE* fp;
        char filename[100];
        sprintf(filename, "./dump_0x%llx_0x%llx", start_address, start_address + total_bytes);
        fp = fopen(filename, "w+");
        fwrite(dump_buffer, 1, total_bytes, fp);
        fclose(fp);
        free(dump_buffer);
    }

    if (search_flag && search_string_found) {
        my_printf(true, "\n\nData dumped from 0x%llx to 0x%llx : \n\n", start_address, start_address + 0x100);
        for (address = start_address; address < start_address + 0x100; address++) {
            number = ptrace(PTRACE_PEEKDATA, pid, (void*) address, (void*) number);
            character = number % 0x100;
            
            if (address%16 == 0)
                my_printf(true, "0x%llx : ", address);
            
            if (character >= 0x20 && character <= 0x7E)
                ascii[address%16] = (char)character;
            else
                ascii[address%16] = '.';
            
            my_printf(true, "%02x ", number % 0x100);

            if ((address + 1) %16 == 0)
                my_printf(true, "    %s\n", ascii);
        }
    }
    
    my_printf(true, "\n\n");
    my_printf(true, "Finished!\n");
}
