reset;
model;
set A;#3
param C{A,A};
param r{A};
var x{A};

minimize O:
    1
;

subject to R {i in A}:
    sum{j in A} x[j]*C[i,j] = r[i]
;

data;
set A:=1    2   3;
param C :
           1	2   3 :=
1   2   4   6
2   4   5   6
3   2   7   12
;
param r:=
1   18
2   24
3   30
;
expand;
option solver cplex;
solve O;
display x;