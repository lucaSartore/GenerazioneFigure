#|/usr/bin/gnuplot -persist
set term post eps enh col 'Helvetica' 24

# Set Palette
set palette defined (0 0 0 .5, 0.125 0 0 1, 0.375 0 1 1, 0.5 0 0.8 0, 0.625 1 1 0, 0.875 1 0 0, 1 0.5 0 0)  # Matlab palette

# x axis
set xrange [0:180]
set xtics 45
set xlabel "{/Symbol j} [deg]"

# y axis
set yrange [0:180]
set ytics 15
set ylabel "{/Symbol q} [deg]"

# Set Colorbar
set cbrange [0:25]
set cblabel "Directivity, D({/Symbol q},{/Symbol j}) [dB]"

# Plot EMS Directivity
set out "Fig.Directivity.EMS.eps"

file_in="../".path_to_stuff."/Synthesis/Global.Directivity.dat"

set title ""

plot file_in u ($2*180/pi):($1*180/pi):(10*log10($5)) w imag t ""
