reset;
model;
var x1>=0;
var x2>=0;
var x3>=0;
var x4>=0;
maximize C:
	35*x1+30*x2-3*x3-4*x4
;
subject to R:
	3*x1+x2+5*x3<= 150
;
subject to R1:
	x1+4*x2+x3<=120
;
option solver cplex;
solve C;
display x1;
display x2;
display x3;