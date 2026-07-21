#
#    Copyright 2017 Kai Pastor
#    
#    This file is part of OpenOrienteering.
# 
#    OpenOrienteering is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
# 
#    OpenOrienteering is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
# 
#    You should have received a copy of the GNU General Public License
#    along with OpenOrienteering.  If not, see <http://www.gnu.org/licenses/>.


# Sets CMAKE_CROSSCOMPILING and variables which describe the target system.
macro(handle_crosscompiling)
	set(CMAKE_CROSSCOMPILING FALSE)
	# These variables must describe the target system
	set(ANDROID )
	set(APPLE   1)
	set(MINGW   )
	set(UNIX    1)
	set(WIN32   )
endmacro()


# This function wraps BundleUtilities' fixup_bundle()
# to make it work for cross-builds.
function(fixup_bundle_portable runtime dirs)
	handle_crosscompiling()
	if(MINGW)
		# gp_tool and gp_cmd are needed for module GetPrerequisites.
		set(gp_tool "objdump")
		set(gp_cmd  "/usr/bin/objdump")
		# grep is used (and desperately needed) to speed up objdump parsing.
		set(gp_grep_cmd "")
		# This function resolves all unknown items which do not match the
		# MinGW DLL name pattern NAME-NUMBER.dll as 'system' libraries,
		# thus catching the Windows system libraries in the MinGW context.
		function(gp_resolve_item_override context item exepath dirs resolved_item_var resolved_var)
			if(NOT ${resolved_var}
			   AND NOT "${item}" MATCHES "-[0-9]*.dll$")
				set(${resolved_item_var} "/system/${item}" PARENT_SCOPE)
				set(${resolved_var} 1 PARENT_SCOPE)
			endif()
		endfunction()
	endif()
	
	if(WIN32)
		include(BundleUtilities)
		file(GLOB_RECURSE plugins "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}${runtime_destination}/plugins/*.dll")
		list(APPEND runtime ${plugins})
		fixup_bundle("$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}${runtime_destination}/Mapper.exe" "${runtime}" "${dirs}")
		# Strip bundled DLLs
		if (CMAKE_INSTALL_DO_STRIP AND NOT "/usr/bin/strip" STREQUAL "")
			file(GLOB dlls "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}${runtime_destination}/*.dll")
			foreach(item ${dlls} ${runtime})
				execute_process(COMMAND "/usr/bin/strip" --strip-unneeded "${item}")
			endforeach()
		endif()
	elseif(APPLE)
		include(BundleUtilities)
		file(GLOB_RECURSE plugins "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}${runtime_destination}/Mapper.app/Contents/MacOS/../PlugIns/*.dylib")
		list(APPEND runtime "${plugins}")
		fixup_bundle("$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}${runtime_destination}/Mapper.app" "${runtime}" "${dirs}")
		if (CMAKE_INSTALL_DO_STRIP AND NOT "/usr/bin/strip" STREQUAL "")
			file(GLOB dylibs "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}${runtime_destination}/Mapper.app/Contents/MacOS/*.dylib")
			foreach(item ${dylibs} ${runtime})
				execute_process(COMMAND "/usr/bin/strip" -x "${item}")
			endforeach()
		endif()
	elseif(ANDROID)
		# Do nothing
	elseif(UNIX)
		# Add required symlinks.
		execute_process(COMMAND ldconfig -n "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}.")
	endif()
endfunction()


# Write a minimal qt.conf if needed.
function(handle_qt_conf)
	handle_crosscompiling()
	set(qt_conf "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}${runtime_destination}/qt.conf")
	if(EXISTS "${qt_conf}")
		message(STATUS "Skipping ${qt_conf}")
		return()
	elseif(WIN32)
		message(STATUS "Writing ${qt_conf}")
		file(RELATIVE_PATH rel_path
		  "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/."
		  "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.")
		if(rel_path STREQUAL "")
			set(rel_path ".")
		endif()
		file(WRITE "${qt_conf}" "\
[Paths]
Plugins=${rel_path}/plugins
Translations=${rel_path}/translations
")
	elseif(APPLE)
		set(qt_conf "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}${runtime_destination}/Mapper.app/Contents/MacOS/../Resources/qt.conf")
		message(STATUS "Writing ${qt_conf}")
		file(WRITE "${qt_conf}" "\
[Paths]
Plugins=PlugIns
")
	endif()
endfunction()


# BundleUtilities stumples upon "/."
set(runtime_destination "/.")
if(runtime_destination STREQUAL "/.")
	set(runtime_destination "")
endif()
set(runtime "")
set(dirs "/bin;;/opt/homebrew/lib/Versions/A")
handle_qt_conf()
fixup_bundle_portable("${runtime}" "${dirs}")
