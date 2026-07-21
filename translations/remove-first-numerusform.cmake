    file(READ "${TS_FILE}.in" data)
    string(REGEX REPLACE "(<translation>)[^<]*<numerusform>[^<]*</numerusform>" "\\1" data "${data}")
    file(WRITE "${TS_FILE}" "${data}")
