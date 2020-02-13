reset;
model;
var x{1..4,1..3};
param  D{1..4};
data tos.dat;
subject to Constraint1 {j in 1..4}:
    sum{ i in 1..3} x[j,i] >= D[j]
;
expand Constraint1;