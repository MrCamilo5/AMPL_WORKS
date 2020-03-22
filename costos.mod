reset;
model;
param M := 1e100;
param Costo{1..13, 1..13};
param Prob{1..3,1..2};
param Alma{4..7,1..2};
param Demanda{8..13};
var x{1..13, 1..13}>=0;
var y{1..3}, binary;
var e{4..7}, binary;
minimize O:
    sum{i in 1..13, j in 1..13} (x[i,j]*Costo[j,i])  + sum{k in 1..3}(y[k]*Prob[k,2]*Prob[k,1]) +sum{t in 4..7}(e[t]*Alma[t,2])
;
subject to RA{i in 1..3}:
    sum{j in 4..7} x[i,j] = Prob[i,1]*y[i]
;
subject to RB {i in 4..7}:
    sum{j in 1..3} x[j,i] <= Alma[i,1]*e[i]
;
subject to R0:
    sum{j in 1..3} y[j] >= 1
;
subject to R1:
    sum{j in 4..7} e[j] >= 1
;
subject to RC{i in 4..7}:
    sum{j in 8..13} x[i,j] <= Alma[i,1]*e[i]
;
subject to RD{j in 8..13}:
    sum{i in 4..7} x[i,j] >= Demanda[j]
;
data;
param Prob:
    1   2:=
1   1600    1270
2   1300    1180
3   1450    1100
;
param Alma:
    1   2:=
4   500 12700
5   800 24000
6   700 18000
7   600 15000
;
param Demanda:=
8   190
9   235
10  295
11  200
12  150
13  130
;
param Costo :
            1   2   3   4   5   6   7   8   9   10  11  12  13:=
1   0   0   0   0   0   0   0   0   0   0   0   0   0   
2   0   0   0   0   0   0   0   0   0   0   0   0   0
3   0   0   0   0   0   0   0   0   0   0   0   0   0
4   9   13.5 8.2 0   0   0   0   0   0   0   0   0  0
5   4.5 13.8 12  0   0   0   0   0   0   0   0   0  0
6   9.6 10 12.4    0   0   0   0   0   0   0   0   0    0
7   13.2 4 6.4 0   0   0   0   0   0   0   0   0   0
8   0   0   0   17  15  10  11  0   0   0   0   0   0
9   0   0   0   30  19.5 24 21    0   0   0   0   0   0
10  0   0   0   70  10  14  10.5  0   0   0   0   0   0
11  0   0   0   16  24  6   7.5  0   0   0   0   0   0
12  0   0   0   12.4    6   6.4 5  0   0   0   0   0   0     
13  0   0   0   17.5    7.6 8   6.9  0   0   0   0   0   0
;

expand;
option solver cplex;
solve O;

display x, y, e;
