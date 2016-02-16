# Convenience function that checks the availability
# of certain C or C++ compiler flags and appends valid ones.

include(CheckCCompilerFlag)
include(CheckCXXCompilerFlag)

function(extract_valid_c_flags varname)
  foreach(flag IN LISTS ARGN)
    string(REGEX REPLACE "[^a-zA-Z0-9_]+" "_" flag_var ${flag})
    set(flag_var "C_FLAG_${flag_var}")
    check_c_compiler_flag("${flag}" "${flag_var}")
    if(${flag_var})
      set(valid_flags "${valid_flags} ${flag}")
    endif()
  endforeach()
  set(${varname} "${valid_flags}" PARENT_SCOPE)
endfunction()

function(extract_valid_cxx_flags varname)
  foreach(flag IN LISTS ARGN)
    string(REGEX REPLACE "[^a-zA-Z0-9_]+" "_" flag_var ${flag})
    set(flag_var "CXX_FLAG_${flag_var}")
    check_cxx_compiler_flag("${flag}" "${flag_var}")
    if(${flag_var})
      set(valid_flags "${valid_flags} ${flag}")
    endif()
  endforeach()
  set(${varname} "${valid_flags}" PARENT_SCOPE)
endfunction()
