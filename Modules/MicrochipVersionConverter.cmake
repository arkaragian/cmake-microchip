# Receives a version like 3.21 and converts it to 3021 in order
# to generate a .clangd file with the correct compiler definitions.

function(convert_mcompiler_version_to_numeric VERSION_STRING OUT_VAR)
    # Split version string into major and minor
    string(REPLACE "." ";" VERSION_PARTS "${VERSION_STRING}")
    list(GET VERSION_PARTS 0 MAJOR)
    list(GET VERSION_PARTS 1 MINOR)

    # Pad major and minor to 2 digits (optional, based on your format)
    # This example keeps major as-is and pads minor to 2 digits if needed
    if(MINOR LESS 10)
        set(MINOR "0${MINOR}")
    endif()

    if(MAJOR LESS 10)
        set(MAJOR "${MAJOR}0")
    endif()

    # Combine into numeric format: 3 + 021 -> 3021
    set(NUMERIC_VERSION "${MAJOR}${MINOR}")

    # Export to parent scope
    set(${OUT_VAR} "${NUMERIC_VERSION}" PARENT_SCOPE)
endfunction()

