#
#    Copyright 2012, 2026 Kai Pastor
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

# locale_t-RUN.cmake is generated from TESTNAME-RUN.cmake.in

set(TEST_OPTIONS "")
if("")
    # Win32 GUI apps don't print to console.
    # Revise with Qt 6.5's QT_WIN_DEBUG_CONSOLE.
    file(REMOVE "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/test/locale_t-out.txt")
    list(APPEND TEST_OPTIONS -o "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/test/locale_t-out.txt")
endif()

execute_process(
    COMMAND /Users/ac/Dev/aibox/app/open-orienteering-map/mapper/test/locale_t ${TEST_OPTIONS}
    RESULT_VARIABLE TEST_RESULT
)

if(TEST_RESULT EQUAL 0)
    # Test successful, update stamp file
    execute_process(
        COMMAND ${CMAKE_COMMAND} -E touch locale_t-RUN.stamp
        WORKING_DIRECTORY /Users/ac/Dev/aibox/app/open-orienteering-map/mapper/test
    )
else()
    # Test failed, terminate this script with an error
    if("" AND EXISTS "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/test/locale_t-out.txt")
        file(READ "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper/test/locale_t-out.txt" TEST_OUTPUT)
        message(STATUS "${TEST_OUTPUT}")
    endif()
    message(FATAL_ERROR "Test locale_t failed: ${TEST_RESULT}")
endif()
