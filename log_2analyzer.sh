#!/bin/bash

if [ $# -lt 1 ]
  then
    echo "Not enough arguments!"
        echo "Enter path to the file"
    read file
else
file=$1
fi

if [ -f "$file" ]
then
echo "$file is a file"
else
echo "$file is not a file"
exit
fi

if [[ $file == *.log ]]
then
echo "$file is a log file"
else
echo "$file is not a log file"
exit
fi

records=$(wc -l $file | awk '{print $1}')

unique_files=0
for var in $(awk 'BEGIN{FS=" - "} {print $1}' $file | sort -u)
do
  unique_files=$[ $unique_files + 1 ]
done

changes_hash=0
for var in $(awk 'BEGIN{FS=" - "} {print $4}' $file | sort -u)
do
  changes_hash=$[ $changes_hash + 1 ]
done


echo "$records $unique_files $changes_hash"
