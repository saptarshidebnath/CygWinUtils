#!/usr/bin/env bash
subLImeExeFile=sublime_text.exe
defaultSublimePath="d:\\Sublime-Text-3\\${subLImeExeFile}"
which sublime_text.exe > /dev/null 2>&1
exitCode=$?
if [[ ${exitCode} -ne 0 ]]; then
    sublimeExe=$(cygpath -u ${defaultSublimePath})
else
    sublimeExe=$(which ${subLImeExeFile})        
fi

if [[ -f ${sublimeExe} ]]; then
    #
    # Just start the sublime
    #
    if [ "$#" -eq 0 ]; then
        cygstart ${sublimeExe}
    else
    #
    # start sublime for all the user inputs
    #
        for var in "$@"
        do
            fileTobOpened="${fileTobOpened} ${var}"
        done
            cygstart ${sublimeExe} ${fileTobOpened}
    fi
else
    echo Please put sublime_text.exe in path or set sublime_text path in the script
    exit 1    
fi
