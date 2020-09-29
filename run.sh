#!/bin/bash
cd run
if [ $ENV_NAME == 'waveform' ] 
then
    dsim -F ../build/repo/waveform/scripts/build-debug.f
    dsim -F ../build/repo/waveform/scripts/run-debug.f 
elif [ $ENV_NAME == 'logfile' ]
then
    dsim -F ../build/repo/logfile/scripts/build.f
    dsim -F ../build/repo/logfile/scripts/run.f
elif [ $ENV_NAME == 'codecoverage' ]
then
    dsim -F ../build/repo/codecoverage/scripts/build.f
    dsim -F ../build/repo/codecoverage/scripts/run.f
elif [ $ENV_NAME == 'functionalcoverage' ]
then
    dsim -F ../build/repo/functionalcoverage/scripts/build.f
    dsim -F ../build/repo/functionalcoverage/scripts/run.f
else
    echo "No environment was selected"
fi
