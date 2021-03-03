# (c) 2016  XingXing(HappyASR#gmail.com)
# (c) 2020  zengfr(362505707#qq.com)(https://github.com/zengfr)
include(CMakeForceCompiler)

# The Generic system name is used for embedded targets (targets without OS) in
# CMake
# set( CMAKE_SYSTEM_NAME          Generic )
set( CMAKE_SYSTEM_NAME          Linux )
set( CMAKE_SYSTEM_PROCESSOR     ARMV5 )

# Set a toolchain path. You only need to set this if the toolchain isn't in
# your system path. Don't forget a trailing path separator!
# set( TC_PATH "" )

# The toolchain prefix for all toolchain executables
set( CROSS_COMPILE m68k-elf- )

set( CMAKE_C_COMPILER ${TC_PATH}${CROSS_COMPILE}gcc.exe )  
set( CMAKE_CXX_COMPILER ${TC_PATH}${CROSS_COMPILE}g++.exe ) 
set( CMAKE_ASM_COMPILER ${TC_PATH}${CROSS_COMPILE}gcc.exe ) 

# specify the cross compiler. We force the compiler so that CMake doesn't
# attempt to build a simple test program as this will fail without us using
# the -nostartfiles option on the command line
CMAKE_FORCE_C_COMPILER( ${CMAKE_C_COMPILER} GNU )
CMAKE_FORCE_CXX_COMPILER( ${CMAKE_CXX_COMPILER} GNU )

# We must set the OBJCOPY setting into cache so that it's available to the
# whole project. Otherwise, this does not get set into the CACHE and therefore
# the build doesn't know what the OBJCOPY filepath is
set( CMAKE_OBJCOPY      ${TC_PATH}${CROSS_COMPILE}objcopy.exe
    CACHE FILEPATH "The toolchain objcopy command " FORCE )
#set( GAME_NAME "dino")
#set( ROM_OFFSET "0xfbb20")
#set( ROM_START "0x000000")
#set( RAM_START "0x810000")
set( GAME_MAP "./${GAME_NAME}.map")
set( ROM_INPUT "./${GAME_NAME}/${GAME_NAME}.bin")
set( ROM_OUTPUT "./${GAME_NAME}/${GAME_NAME}_hack.bin")

# Set the CMAKE C flags (which should also be used by the assembler!# -Werror
set( CMAKE_C_FLAGS "-m68000 -std=c99 -g -fomit-frame-pointer -Winline -Wall -Wa,--register-prefix-optional -I. -Isrc" )
set( CMAKE_EXE_LINKER_FLAGS "-nostdlib -Wl,-Map,${GAME_MAP},-T,../../68K.lds,--section-start,.rom=${ROM_START},--section-start,.ram=${RAM_START}")
set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS}" CACHE STRING "" )
set( CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS}" CACHE STRING "" )
set( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}" CACHE STRING "" )
