#!/bin/bash
cd run
pwd
dsim -F ../build/repo/waveform-sample/scripts/build-debug.f
dsim -F ../build/repo/waveform-sample/scripts/run-debug.f
#ls -allh *

dsim -F ../build/repo/logfile/scripts/build.f
dsim -F ../build/repo/logfile/scripts/run.f