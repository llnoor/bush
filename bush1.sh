#!/bin/bash

mv management_fi management_files
cd management_files
mkdir dconfiguration
mv `find . -maxdepth 1 -type f -name "*.conf"` configuration
mkdir map
mv map_1.1 map
mkdir logs
mv `find . -maxdepth 1 -type f -name "*.log"` logs

