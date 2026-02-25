set terminal png size 800,600
set output 'department_vulnerabilities.png'
set title "Critical Vulnerabilities by Department"
set boxwidth 0.5
set style fill solid
set xlabel "Departments"
set ylabel "Number of Critical Vulnerabilities"
set grid
set yrange [0:*]
set xtics nomirror
set ytics nomirror
plot "department_vulnerabilities.dat" using 2:xtic(1) 
with boxes lc rgb "red" title "Critical 
Vulnerabilities", \
 '' using 0:2:2 with labels offset 0,1 notitle
