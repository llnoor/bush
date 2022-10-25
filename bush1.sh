#!/bin/bash

mv management_fi management_files
cd management_files
mkdir dconfiguration
mv `find . -maxdepth 1 -type f -name "*.conf"` configuration
mkdir map
mv map_1.1 map
mkdir logs
mv `find . -maxdepth 1 -type f -name "*.log"` logs

pkill -f control.sh

./help/keygen.sh
cd key
rm `find . -maxdepth 1 -type f -name "file*"`
cd ..
./help/unifier.sh
rm -R key
mv main3.key help
