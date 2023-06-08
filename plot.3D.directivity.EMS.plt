#!/usr/bin/gnuplot
# =============================================================
# Plot 3D radiation pattern in spherical coordinates
# -------------------------------------------------------------
# Use this Gnuplot script to create a 3D radiation pattern
# from file
#
# NOTE:
# - Input file structure: Theta[deg] Phi[deg] Abs[dB]
# - Choose to interpolate or not your data, depending on how
#   detailed is the exported data.
# -------------------------------------------------------------
# Author: ELEDIA Research Center
# Date:   10 Dec 2012
# =============================================================

set terminal postscript eps color enhanced "Helvetica" 20 size 4,4 dl 3

# 3D view rotation and zoom
# ISOMETRIC: Phi=150, Theta=60
# ----------------------------
phi=120
theta=80
kzoom=1.20

set view equal xyz  # force equal units to all three axes
set view theta,phi,kzoom

set mapping spherical
set angles radians
set size ratio -1
set ticslevel 0

set xyplane at 0

unset xtics
unset ytics
unset ztics
unset border

# Surface lines style
set style line 1 lt 1 lc rgb "black" lw .2
set pm3d at s depthorder #No surface lines

# Interpolation factor
#set pm3d interpolate 2,2
#set pm3d interpolate 1,1

f(ABS)=ABS>=0?ABS:1/0

# Colorbox
# ----------------------------
set cblabel "Directivity, |D({/Symbol q},{/Symbol f})| [dB]" offset +1

set colorbox vertical user origin .80,.25 size .04,.55
set style line 2604 linetype -1 linewidth .8
set colorbox border 2604
set palette defined (0 0 0 .5, 0.125 0 0 1, 0.375 0 1 1, 0.5 0 0.8 0, 0.625 1 1 0, 0.875 1 0 0, 1 0.5 0 0)  # Matlab palette

# Set EMS aperture
maxY=60
maxZ=60
set arrow 20 nohead from 0,-maxY,-maxZ to 0,maxY,-maxZ lc -1
set arrow 21 nohead from 0,maxY,-maxZ to 0,maxY,maxZ lc -1
set arrow 22 nohead from 0,-maxY,-maxZ to 0,-maxY,maxZ lc -1
set arrow 23 nohead from 0,-maxY,maxZ to 0,maxY,maxZ lc -1
set object 1 polygon from 0,-maxY,-maxZ to 0,-maxY,maxZ to 0,maxY,maxZ to 0,maxY,-maxZ to 0,-maxY,-maxZ fillstyle solid noborder fillcolor rgb 'dark-grey'

#set label 100 "EMS" at 0,1.6*maxY,-1.00*maxZ
#set arrow from 0,1.5*maxY,-1*maxZ to 0,maxY,-maxZ

# Max value plotted
max=25
min=0
step=5

# Axis length and Plot Offset
axis_len=80
zshift=60

# Set the colorbox
set cbrange [min:max]
set cbtics min,step,max

# Set the range and axes
set xrange [-(zshift+max):(zshift+max)]
set yrange [-(zshift+max):(zshift+max)]
set zrange [-(zshift+max):(zshift+max)]

set label 1 "z" at (axis_len+100)*1.1,0,0.0
set label 2 "x" at 0,axis_len*1.15,0.0
set label 3 "y" at 0,0,axis_len*1.1

# Set correctly the axis
set arrow 101 from  0,  0,  0 to axis_len+100,0,0 back head filled lw 3  # z
set arrow 102 from  0, 0 ,  0 to 0,axis_len+10,0 back head filled lw 3   # x
set arrow 103 from  0,  0,  0 to 0,0,axis_len back head filled lw 3   # y

# --------------------------------

# =============================================================
# EMS 50x50
# =============================================================

file_in="../".path_to_stuff."/Synthesis/Gnuplot-Global.Directivity.dat"

set out 'Fig.3D.Directivity.EMS.eps'

set title ""

# Plot actual directivity
stats file_in u 3 nooutput

splot file_in u (-$2+pi/2):(pi/2-$1):(f(10*log10($3)+zshift)):(10*log10($3)) t '' w pm3d

