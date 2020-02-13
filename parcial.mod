reset;
model;
set A; #4
set B;#3
param fo{A,B};
param P1{A,A};
param P2{A,A};
param P3{A,A};
var y{A,B}, binary;
minimize W:
    sum{i in A, j in B} y[i,j]*fo[i,j]
;
subject to R1 {i in A}:
    sum{j in B} y[i,j] = 1
;
subject to R2 {i in A}:
    sum{j in B} y[i,j] = sum{j in A}(P1[j,i]*y[j,1])+sum{j in A}(P2[j,i]*y[j,2])+sum{j in A}(P3[j,i]*y[j,3])
;
data;
set A:=1    2   3   4;
set B:=1    2   3;
param fo :
            1   2   3:=
1 1000   1000  1000  
2  40000 2000  2000
3  40000 20000 4000       
4  40000 20000 40000
;
param P1:
            1   2   3   4 :=
1   0.4 0.3 0.2 0.1
2   1   0   0   0
3   1   0   0   0
4   1   0   0   0
;
param P2:
            1   2   3   4 :=
1   0.4 0.3 0.2 0.1
2   0   0.2   0.6   0.2
3   0   1   0   0
4   0   1   0   0
;
param P3:
            1   2   3   4 :=
1   0.4 0.3 0.2 0.1
2   0   0.2   0.6   0.2
3   0   0   0.4   0.6
4   1   0   0   0
;
expand;
option solver cplex;
solve W;
display y;