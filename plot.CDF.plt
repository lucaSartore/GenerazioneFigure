#!/usr/bin/gnuplot
set term postscript eps enhanced color "Helvetica" 24 dl 3




# x-axis
set xlabel "Received Power, P(x,y) [dBm]"

X_MIN=-80  # EDIT PARAMETER!
X_MAX=-40  # EDIT PARAMETER!
X_STEP=5   # EDIT PARAMETER!

set xrange [X_MIN:X_MAX]
set xtics X_STEP

# y-axis
set ylabel "Cumulative Density Function, {/Symbol Q}"

Y_MIN=0
Y_MAX=1
Y_STEP=0.2

set yrange [Y_MIN:Y_MAX]
set ytics Y_STEP

# Legend
set key spacing 1.25
set key samplen 1.25
set key bottom right

# Optional: Show grid
set grid


# CDF - RoI Threshold -70 [dBm]
# ================================================
file_out='Fig.EMS.N.Simulated.CDF.eps'  # EDIT EMS NUMBER --> EMS.N?
set out file_out

# Threshold
set arrow from -65,0 to -65,1 lt 2 lw 6 lc rgb 'black' nohead front # SET THRESHOLD VALUE --> from x?,0 to x?,1
set arrow from -68,0.8 to -65,0.7 lw 1 lc rgb 'black' front         # SET ARROW BEST LOCATION --> from x?,y? to x?,y? 

set label 'P_{th}' at -69.5,0.85 front                              # SET LABEL LOCATION --> at x?,y?

file_in1="../".path_to_stuff."/Analysis/Cumulative.Density.Function.Reference.dat"
file_in2="../".path_to_stuff."/Analysis/Cumulative.Density.Function.EMS.dat"

plot file_in1 u (10*log10($1)+30):2 w l lt 1 lc rgb 'grey50' lw 8 t "Reference",\
     file_in2 u (10*log10($1)+30):2 w l lt 1 lc rgb 'magenta' lw 8 t "SEME"

