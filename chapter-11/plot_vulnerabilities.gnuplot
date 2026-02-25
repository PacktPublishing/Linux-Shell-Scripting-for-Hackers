set terminal png size 800,600
set output 'vulnerabilities.png'
set title "Vulnerabilities Over Time"
set xlabel "Time"
set ylabel "Number of Vulnerabilities"
set grid
plot "vulnerabilities.dat" using 1:2 with lines title 
"Segment A", \
 "vulnerabilities.dat" using 1:3 with lines title 
"Segment B", \
 "vulnerabilities.dat" using 1:4 with lines title 
"Segment C"
