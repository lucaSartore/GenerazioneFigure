#!/usr/bin/gnuplot -persist
set term post eps enh col 'Helvetica' 24

set size ratio -1

# x axis
set xrange [-0.13:0.13]
set xtics 0.065
set xlabel "x [m]"

# y axis
set yrange [-0.13:0.13]
set ytics 0.065
set ylabel "y [m]" offset +2

# Set Patch Color
patchColor="#DC7F64"

#
# SQUARE PATCHES, P=Q=50 Elements
#
set out "Fig.SQUARE.PATCH-9x9.EMS-Layout.eps"
file_in="../".path_to_stuff."/Synthesis/L.values.dat"

# Scale value for patch dots
SCALE=22E+1 # Parameter to EDIT, if needed

plot file_in u 1:2:($4*SCALE) w p pt 5 lc rgb patchColor ps var not

