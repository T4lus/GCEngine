
find_path(angelscript_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/dependency/Angelscript")

if((NOT angelscript_INCLUDE_DIR) OR (NOT EXISTS ${angelscript_INCLUDE_DIR})

    message("Unable to locate AngelScript dependency.")

    execute_process(COMMAND git submodule update --init -- dependency/Angelscript WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
    set(angelscript_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/dependency/Angelscript/angelscript/include")

    install(DIRECTORY ${angelscript_INCLUDE_DIR}/include DESTINATION "${PROJECT_SOURCE_DIR}/Includes")
else()
    # see above, setup target as well
endif()


