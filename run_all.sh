#!/bin/bash

# Set the variable
export path_to_stuff="EMS.32.L_0.57m-x_29.40m-y_2.00m-z_2.45m"
PREFIX="EMS.32_"  # Specify the desired prefix of the file here

# Run all images
gnuplot -e "path_to_stuff=\"$path_to_stuff\"" plot.2D.directivity.EMS.plt
gnuplot -e "path_to_stuff=\"$path_to_stuff\"" plot.3D.directivity.EMS.plt
gnuplot -e "path_to_stuff=\"$path_to_stuff\"" plot.CDF.plt
gnuplot -e "path_to_stuff=\"$path_to_stuff\"" plot.difference.map.nominal.plt
gnuplot -e "path_to_stuff=\"$path_to_stuff\"" plot.difference.thresholded.map.plt
gnuplot -e "path_to_stuff=\"$path_to_stuff\"" plot.EMS.layout.plt
gnuplot -e "path_to_stuff=\"$path_to_stuff\"" plot.EMS.received.power.plt
gnuplot -e "path_to_stuff=\"$path_to_stuff\"" plot.EMS.threshold.map.plt



# Iterate over each file in the current directory ending with .eps
for file in *.eps; do
    if [ -f "$file" ]; then
        # Extract the base filename without extension
        filename=$(basename "$file" .eps)

        # Generate the new filename with the specified prefix
        new_filename="${PREFIX}${filename}.eps"

        # Rename the file
        mv "$file" "$new_filename"
        echo "Renamed: $file -> $new_filename"
    fi
done


# Create the Results folder if it doesn't exist
mkdir -p Results

# Move all .dat files to the Results folder
mv *.eps Results/

echo "Files moved successfully!"


