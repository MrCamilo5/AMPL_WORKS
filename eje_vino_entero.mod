reset;
model;
var x {1..3,1..3}>=0; #Creamos las 9 variables 
maximize O: 
    1 
; #FO dummie
subject to R1 {j in 1..3}:
    sum{i in 1..3} x[i,j] = 7
;
subject to R2 {i in 1..3}:
    sum{j in 1..3} x[i,j] = 7
;
subject to R3 {j in 1..3}:
    sum{i in 1..2} x[i,j] /i= 3.5
;
expand;
option solver cplex;
solve O;
display x;
