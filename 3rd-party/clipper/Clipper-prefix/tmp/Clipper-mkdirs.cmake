# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file LICENSE.rst or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/3rd-party/clipper/Clipper-prefix/src/Clipper")
  file(MAKE_DIRECTORY "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/3rd-party/clipper/Clipper-prefix/src/Clipper")
endif()
file(MAKE_DIRECTORY
  "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/3rd-party/clipper/Clipper-prefix/src/Clipper-build"
  "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/3rd-party/clipper/Clipper-prefix"
  "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/3rd-party/clipper/Clipper-prefix/tmp"
  "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/3rd-party/clipper/Clipper-prefix/src/Clipper-stamp"
  "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/3rd-party/clipper/download"
  "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/3rd-party/clipper/Clipper-prefix/src/Clipper-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/3rd-party/clipper/Clipper-prefix/src/Clipper-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/3rd-party/clipper/Clipper-prefix/src/Clipper-stamp${cfgdir}") # cfgdir has leading slash
endif()
