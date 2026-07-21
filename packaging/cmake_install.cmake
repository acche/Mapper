# Install script for directory: /Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/images/mapper-icon/Mapper.icns")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/opt/homebrew/share/proj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/gdal" TYPE DIRECTORY FILES "/opt/homebrew/Cellar/gdal/3.13.1_4/share/gdal/")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/opt/homebrew/bin/cmake" --build "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging" --target "qt-translations")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_bg.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_cs.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_da.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_de.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_en.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_es.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_fi.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_fr.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_he.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_ar.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_bg.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_ca.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_cs.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_da.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_de.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_en.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_es.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_fr.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_gl.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_hr.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_hu.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_it.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_ja.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_ka.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_ko.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_nl.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_nn.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_pl.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_pt_BR.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_ru.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_sk.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_sl.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_sv.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_tr.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_uk.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_zh_CN.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_help_zh_TW.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_hr.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_hu.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_it.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_ja.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_ko.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_lv.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_nl.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_pl.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_pt_BR.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_pt_PT.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_pt_BR.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_pt_PT.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_ru.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_sv.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_tr.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_uk.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_zh_CN.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/qt_zh_TW.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/./Mapper.app/Contents/MacOS" TYPE PROGRAM FILES "/opt/homebrew/bin/Assistant")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/opt/homebrew/bin/cmake" --build "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging" --target "assistant-translations")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/assistant_bg.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/assistant_cs.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/assistant_da.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/assistant_de.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/assistant_en.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/assistant_es.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/assistant_fr.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/assistant_hr.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/assistant_hu.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/assistant_ja.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/assistant_ko.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/assistant_nl.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/assistant_pl.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/assistant_pt_BR.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/assistant_pt_BR.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/assistant_ru.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/assistant_sv.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/assistant_tr.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/assistant_uk.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/assistant_zh_CN.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/assistant_zh_TW.qm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/custom_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/android/cmake_install.cmake")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/packaging/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
