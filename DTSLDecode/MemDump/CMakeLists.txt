cmake_minimum_required(VERSION 3.6.0) # 指定cmake最低版本

project (android_memory_dump) # 指定项目名称

enable_language(C CXX ASM)

aux_source_directory(./ DUMPSRC)

add_executable(android_memory_dump  ${DUMPSRC} 
)