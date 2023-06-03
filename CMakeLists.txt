cmake_minimum_required(VERSION 3.20)
project(pasc LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 17)

set(LLVM_RUNTIME_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/bin)
set(LLVM_LIBRARY_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/lib)

list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")

find_package(LLVM 15.0 CONFIG REQUIRED)

include(TableGen)
include(AddLLVM)
include(HandleLLVMOptions)

include_directories(${LLVM_INCLUDE_DIRS})
include_directories(${PROJECT_SOURCE_DIR}/include/pasc)
include_directories(${PROJECT_BINARY_DIR}/include/pasc)
link_directories(${LLVM_BUILD_LIBRARY_DIR})
add_definitions(${LLVM_DEFINITIONS})

# add_subdirectory(include)

add_executable(pasc tools/pasc.cpp lib/AST.cpp)
target_link_libraries(pasc PRIVATE LLVM-15)
