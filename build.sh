#!/bin/bash

Project='Voxel'

cd src &&
ophis -d -v 1 ${Project}.oph ../build/${Project}.nes | tee -a ../build/build.log
