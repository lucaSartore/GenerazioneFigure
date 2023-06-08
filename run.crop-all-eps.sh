#!/bin/bash

# PARAMETERS
# ===============================================
input_file_name_pattern="*eps"


# PROCESSING - DO NOT EDIT BELOW
# ===============================================
# List all files matching the pattern
ls $input_file_name_pattern > list.txt

num_files=$(wc -l list.txt | awk '{print $1}')

for i_x_for in $(seq 1 $num_files)
do

  filename=$(awk '{if (NR=='$i_x_for') {print;}}' list.txt)

  echo "Cropping "$filename"..."
  
  epstool --copy --bbox --quiet $filename tmp.eps

  # Substitute only if success
  RETURN_CODE=$(echo $?)
  if [ $RETURN_CODE -eq 0 ]
  then
    mv tmp.eps $filename
  fi


done

rm list.txt

