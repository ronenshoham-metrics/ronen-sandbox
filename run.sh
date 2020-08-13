#!/bin/bash
cd run
if [ $ENV_NAME == 'waveform' ] 
then
    dsim -F ../build/repo/waveform/scripts/build-debug.f
    dsim -F ../build/repo/waveform/scripts/run-debug.f
fi
#ls -allh *

if [ $ENV_NAME == 'logfile' ]
then
    dsim -F ../build/repo/logfile/scripts/build.f
    dsim -F ../build/repo/logfile/scripts/run.f
fi