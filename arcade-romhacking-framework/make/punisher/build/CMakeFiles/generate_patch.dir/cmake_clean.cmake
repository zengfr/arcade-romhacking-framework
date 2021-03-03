file(REMOVE_RECURSE
  "../.././punisher/punisher_hack.bin"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/generate_patch.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
