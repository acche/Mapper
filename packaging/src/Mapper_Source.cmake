#
#    Copyright 2012, 2013, 2014 Kai Pastor
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

# Synopsis:
#   cmake [ -DPREFIX=my/prefix ] [ -DARCHIVE_NAME=prefix-src ]
#         [ -DOUTPUT_DIR=/usr/src ] [ -DSKIP_CHECK=1 ] -P Mapper_Source.cmake

if (NOT PREFIX)
	set(PREFIX "openorienteering-mapper-0.9.7")
endif ()

if (NOT ARCHIVE_NAME)
	set(ARCHIVE_NAME "openorienteering-mapper_0.9.7-src")
endif ()

if (NOT OUTPUT_DIR)
	set(OUTPUT_DIR "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper")
endif ()
if (NOT OUTPUT_DIR)
	set(OUTPUT_DIR .)
endif ()

if (NOT SKIP_CHECK)
	# Check that the working directory is clean.
	set(ENV{LANG} C)
	execute_process(
	  COMMAND "/usr/bin/git" status
	  WORKING_DIRECTORY "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper"
	  OUTPUT_VARIABLE GIT_STATUS_OUTPUT
	)
	if (NOT GIT_STATUS_OUTPUT MATCHES "working directory clean")
		message(${GIT_STATUS_OUTPUT})
		message(FATAL_ERROR
		  "Source package must be created from a clean git working directory, "
		  "or you must specify -DSKIP_CHECK=1."
		)
	endif ()
endif ()

# Let git build the archive
message(STATUS "Creating ${PREFIX}.tgz")
execute_process(
  COMMAND "/usr/bin/git" archive
    --format "tgz"
    --prefix "${PREFIX}/"
    --output "${OUTPUT_DIR}/${ARCHIVE_NAME}.tgz"
    HEAD
  WORKING_DIRECTORY "/Users/ac/Dev/aibox/app/open-orienteering-map/mapper"
)
