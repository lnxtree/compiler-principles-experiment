cmake_minimum_required(VERSION 3.16)

aux_source_directory(. CHECKER_LIB_SRCS)

add_library(checker ${CHECKER_LIB_SRCS})

target_include_directories(checker PRIVATE "${PARSER_INCLUDE}")
