reset;
model;
set A;
set B;
var x {A,A}>=0;
maximize O:
    1
;
subject to R1 {j in A}:
    sum{i in A} x[i,j] = 7
;
subject to R2 {i in A}:
    sum{j in A} x[i,j] = 7
;
subject to R3 {j in A}:
    sum{i in B} x[i,j] /i= 3.5
;
data;
set A:=1    2   3;
set B:=1    2;
expand;
option solver cplex;
solve O;
display x;