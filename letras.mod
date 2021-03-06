reset;
model;
set A; #8
set B; #3
var x {A}, binary;
param C{A};
param D{A,B};
maximize O:
    sum{i in A} x[i]*C[i]
;
subject to R1:
    sum{j in A} x[j] = 1
;
subject to R2{i in 1..2}:
    sum{j in A} x[j]*(D[j,i+1]+D[j,i]) >= 1
;
data;
set A:=1    2   3   4   5   6   7   8;
set B:=1    2   3;
param C :=
1   27
2   25
3   43
4   27
5   30
6   29
7   40
8   30
;
param D: 
        1   2   3:=
1   1   2   3
2   4   5   6
3   7   8   9
4   10  11  12
5   13  14  15
6   16  17  18
7   19  20  21
8   22  23  24
;
expand;
option solver cplex;
solve O;
display x;
