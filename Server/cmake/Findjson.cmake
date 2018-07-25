find_path( json_INCLUDE json.hpp HINTS "${PROJECT_SOURCE_DIR}/dependency/json/include/nlohmann" )

if ( json_INCLUDE )
    set( JSON_FOUND TRUE )

    message( STATUS "Found Json include at: ${json_INCLUDE}" )
else ( )
    message( FATAL_ERROR "Failed to locate Json dependency." )
endif ( )
