reset;
model;
param Param {1..3};
param C{1..2};
var x{1..3,1..2}>=0;
var D>=0;

maximize Obj:
    1
;
subject to R {i in 1..3}:
    sum{j in 1..2} x[i,j] = Param[i]
;
subject to R2 {i in 1..3}:
    sum{j in 1..2} x[i,j]*C[j] = D
;

data;
param Param :=
1   50
2   30
3   10
;
param C :=
1   0.1428571429
2   3
;
expand;
option solver cplex;
solve Obj;
display x;