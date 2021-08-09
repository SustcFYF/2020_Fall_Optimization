f=-[8,6,3,-2];
A=[1,2,2,4;2,-1,1,2;4,-2,1,-1];
b=[40,8,10];
Aeq=[];
beq=[];
lb=zeros(4,1);
ub=[];
[x,z]=linprog(f,A,b,Aeq,beq,lb,ub)