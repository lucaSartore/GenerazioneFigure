#!/usr/bin/gnuplot -persist
set term post eps enh col 'Helvetica' 24 dl 3
set encoding iso_8859_1

set size ratio -1

# Colorbar
set palette defined (0 'red', 0.5 'yellow', 1 'green')
set cbrange [-5:5]
set cbtics 1
set colorbox user
set colorbox horizontal origin graph 0,-0.85 size graph 1,graph 0.105
set cblabel "{/Symbol D}P_{RX}(x,y) [dBm]" offset 1.25

# x-axis
set xlabel 'x [m]'
X_MIN=-1
X_MAX=30
X_TICS=5
set xrange [X_MIN:X_MAX]
set xtics X_TICS

# y-axis
set ylabel 'y [m]'
Y_MIN=-2
Y_MAX=4
Y_TICS=2
set yrange [Y_MIN:Y_MAX]
set ytics Y_MIN,Y_TICS,Y_MAX

set tics front

# Hallway B2 - Received Power, Difference
# =======================================
set out 'Fig.Difference.Map.EMS.N.Hallway-B2.eps'
set title 'Simulated Data - Hallway "B(2)", w/ EMS'

# Labels
unset label
set label '{/Symbol Y}' at 27.75,1.00 tc rgb 'black' front
set label '{/:Bold r}_{{/Symbol W}}' at 9.2,3.5 tc rgb 'black' center front
set label 'S' at 28.0,2.0 tc rgb 'blue' front

file_in1="../".path_to_stuff."/Analysis/Difference.Received.Power.x.Plot.dat"
file_in2="../../Scenario.Reference/Scenario/Scenario.Mesiano.Hallway-B2.Walls.dat"
file_in3="../../Scenario.Reference/Scenario/Scenario.Mesiano.Hallway-B2.Doors.dat"
file_in4="../../Scenario.Reference/Scenario/Scenario.Mesiano.Hallway-B2.Windows.dat"
file_in5="../../Scenario.Reference/Scenario/AP.Location.dat"
file_in6="../../Scenario.Reference/Scenario/RoI.Position.dat"
file_in7="../".path_to_stuff."/Synthesis/EMS.Location.dat"

plot file_in1 u 1:2:4 w p pt 5 ps 2 lc palette notitle,\
     file_in2 u 1:2 w l lt 1 lw 10 lc rgb 'black' notitle,\
     file_in3 u 1:2 w l lt 1 lw 8 lc rgb 'grey' notitle,\
     file_in4 u 1:2 w l lt 1 lw 8 lc rgb 'white' notitle,\
     file_in5 u 1:2 w p pt 7 ps 2 lc rgb 'black' notitle,\
     file_in6 u 1:2 w p pt 7 ps 1 lc rgb 'black' notitle,\
     file_in7 u 1:2 w p pt 2 ps 2.5 lw 10 lc rgb 'blue' notitle
