cmake_minimum_required(VERSION 3.6.0) # 指定cmake最低版本

project (libVex) # 指定项目名称

enable_language(C CXX ASM) 

set(CMAKE_CXX_FLAGS "-std=c++11 -gstabs+ -O0 -Wall -Wno-unused")

aux_source_directory(../ VEXSRC)
aux_source_directory(. EXECUTABLESRC)

add_library(Vex SHARED  ${VEXSRC}
                        ${EXECUTABLESRC}
)