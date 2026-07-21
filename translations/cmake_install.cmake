# Install script for directory: /Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources/translations" TYPE FILE FILES
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_bg.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_cs.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_da.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_de.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_en.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_eo.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_es.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_et.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_fi.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_fr.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_he.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_hr.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_id.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_it.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_ja.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_ko.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_lv.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_nb.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_nl.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_pl.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_pt.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_pt_BR.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_ru.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_sv.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_ta.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_tr.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_uk.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_zh_CN.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_zh_Hant.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/OpenOrienteering_hu.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/map_symbols_cs.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/map_symbols_da.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/map_symbols_de.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/map_symbols_eo.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/map_symbols_es.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/map_symbols_fi.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/map_symbols_fr.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/map_symbols_hr.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/map_symbols_hu.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/map_symbols_it.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/map_symbols_lv.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/map_symbols_nb.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/map_symbols_nl.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/map_symbols_pl.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/map_symbols_pt.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/map_symbols_ru.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/map_symbols_sv.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/map_symbols_tr.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/map_symbols_uk.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/map_symbols_zh_CN.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/qt_eo.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/qt_et.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/qt_id.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/qt_nb.qm"
    "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/qt_nl.qm"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/bg.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/cs.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/da.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/de.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/en.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/eo.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/es.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/et.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/fi.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/fr.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/he.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/hr.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/hu.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/id.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/it.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/ja.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/ko.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/lv.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/nb.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/nl.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/pl.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/pt.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/pt_BR.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/ru.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/sv.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/ta.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/tr.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/uk.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/zh_CN.lproj")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Mapper.app/Contents/Resources" TYPE DIRECTORY FILES "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/zh_Hant.lproj")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/translations/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
