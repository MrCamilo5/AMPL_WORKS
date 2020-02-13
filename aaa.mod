reset;
model;
var x{1..4,1..3}>=0;
#vamos a crear los parametros
param G{1..4};
param Vol{1..4};
param Pe{1..4};
param Cap{1..3};
param vo{1..3};
data av.dat;
#display x, Pe, G, Vol, Cap,vo;
maximize  U:
    sum{i in 1..4,j in 1..3} G[i]*x[i,j]
;
expand U;
subject to Constraint1 {j in 1..3}:
    sum{i in 1..4} x[i,j] <= Cap[j]
;
expand Constraint1;
subject to Constraint2 {j in 1..3}:
    sum{i in 1..4} x[i,j]*Vol[i] <= vo[j]
;
expand Constraint2;
subject to Constraint3 {i in 1..4}:
    sum{j in 1..3} x[i,j] <= Pe[i]
;
expand Constraint3;
subject to Constraint4:
   1.6* sum{i in 1..4} x[i,1] =  sum{i in 1..4} x[i,2]
;
subject to Constraint5:
   2* sum{i in 1..4} x[i,3] =  sum{i in 1..4} x[i,2]
;
expand Constraint4, Constraint5;
option solver cplex;
solve U; 
display U;
display x;