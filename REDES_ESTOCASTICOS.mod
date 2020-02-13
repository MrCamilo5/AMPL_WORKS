reset; 
model;
set A;
set B;
param D{A,B}; 
var x{A,B}, binary;
minimize C:
    sum{i in A,j in B} x[i,j]*D[i,j]
;
subject to R1:
    sum{j in 2..4} x[1,j] = 1
;
subject to R2 {j in 2..4}:
    x[1,j] = sum{i in 5..7} x[j,i]
;
subject to R3 {j in 5..7}:
    sum{i in 2..4} x[i,j] = sum{k in 8..9} x[j,k]
;
subject to R4 {i in 8..9}:
    sum{j in 5..7} x[j,i] = x[i,10]
;
subject to R5:
    sum{j in 8..9} x[j,10] = 1
;
data;
set A:=1    2   3   4   5   6   7   8   9;
set B:=2   3   4   5   6   7   8   9   10;
param D :
            2   3   4   5   6   7   8   9   10 :=
1   2   4   3   0   0   0   0   0   0
2   0   0   0   7   4   6   0   0   0
3   0   0   0   3   2   4   0   0   0
4   0   0   0   4   1   5   0   0   0
5   0   0   0   0   0   0   1   4   0
6   0   0   0   0   0   0   6   3   0
7   0   0   0   0   0   0   3   3   0
8   0   0   0   0   0   0   0   0   3
9   0   0   0   0   0   0   0   0   4
;
expand;
option solver cplex;
solve C;
display x;
