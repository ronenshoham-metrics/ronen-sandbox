#!/bin/bash
cd run
pwd
dsim -F ../build/repo/waveform/scripts/build-debug.f
dsim -F ../build/repo/waveform/scripts/run-debug.f
#ls -allh *

dsim -F ../build/repo/logfile/scripts/build.f
dsim -F ../build/repo/logfile/scripts/run.f