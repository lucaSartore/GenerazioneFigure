for line in *eps; do
outFileEPS=${line%????}".CROP.eps"
outFileName=${line%????}".jpg"
echo "Converting: $line --> $outFileName"
epstool --quiet --copy --bbox $line $outFileEPS
convert -density 400 $outFileEPS $outFileName
mv $outFileEPS $line
done
echo "Done converting."
