reset;
model;
set A; #3
param fo{A,A};
param P1{A,A};
param P2{A,A};
param P3{A,A};
var y{A,A}, binary;
minimize W:
    sum{i in A, j in A} y[i,j]*fo[i,j]*(-1)
;
subject to R1 {i in A}:
    sum{j in A} y[i,j] = 1
;
subject to R2 {i in A}:
    sum{j in A} y[i,j] = sum{j in A}(P1[j,i]*y[j,1])+sum{j in A}(P2[j,i]*y[j,2])+sum{j in A}(P3[j,i]*y[j,3])
;
data;
set A:=1    2   3;
param fo :
            1   2   3:=
1   280.0  220.0  258.0 
2   250.0  110.0  255.0  
3   220.0 -130.0  300.0
;
param P1:
            1   2   3 :=
1   0.4 0.5 0.1
2   0.1 0.7 0.2
3   0.1 0.2 0.7
;
param P2:
            1   2   3 :=
1   0.7 0.2 0.1
2   0.3 0.6 0.1
3   0.1 0.7 0.2
;
param P3 :
            1   2   3 :=
1   0.2 0.5 0.3
2   0   0.7 0.3
3   0   0.2 0.8
;
expand;
option solver cplex;
solve W;
display y;