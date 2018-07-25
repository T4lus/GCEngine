cmake_minimum_required(VERSION 3.0)
project( "GCEngineServer" VERSION 0.1.0 LANGUAGES CXX )
message( "Copyright, Global Chaos, All Rights Reserved." )


#
# Configuration
#
set( CMAKE_CXX_STANDARD 11 )
set( INCLUDES_DIR "${PROJECT_SOURCE_DIR}/Includes" )
set( SOURCES_DIR  "${PROJECT_SOURCE_DIR}/Sources/" )


if( ${CMAKE_CXX_COMPILER_ID} STREQUAL MSVC )
    set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /D_WIN32_WINNT=0x0601 /W4 /wd4068 /wd4702" )
endif ( )

if( NOT WIN32 )
    set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Weffc++ -pedantic -Wno-unknown-pragmas" )
endif ( )

if ( UNIX AND NOT APPLE )
    set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread" )
endif ( )

if ( APPLE )
    set( CMAKE_MACOSX_RPATH ON )
endif ( )


set( CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/cmake" )

find_package( angelscript REQUIRED )
find_package( json REQUIRED )
find_package( restbed REQUIRED )



#
# Build
#
file( GLOB_RECURSE SOURCES "${SOURCES_DIR}/*.cpp" )
add_executable(${PROJECT_NAME} ${SOURCES})
