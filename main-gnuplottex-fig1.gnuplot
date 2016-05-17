set terminal epslatex color solid
set output 'main-gnuplottex-fig1.tex'
set grid
set xzeroaxis lt -1
set yzeroaxis lt -1
set title '$y = f(x) = \frac{\cos x}{2} \, x^3$'
set format y "$%g$"
set format x "$%g$"
set xrange [-3:3]
set xlabel '$x$-Achse'
set ylabel '$y$-Achse'
f(x) = (cos(x) * x**3) / 2
plot f(x) notitle lw 3
