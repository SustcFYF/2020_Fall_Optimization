%% UA
clc
f=-[1,0,0,0,0];
A=-[-1,3,2,-1,-1;-1,-2,3,2,-2;-1,1,-3,-2,4;-1,2,0,2,1];
b=[0;0;0;0]; 
Aeq=[0,1,1,1,1];
beq=[1];
lb=[];
ub=[];
[x,z]=linprog(f,A,b,Aeq,beq,lb,ub)
%% DU
clc
f=[1,0,0,0,0];
A=[-1,3,-2,1,2;-1,2,3,-3,0;-1,-1,2,-2,2;-1,-1,-2,4,1];
b=[0;0;0;0]; 
Aeq=[0,1,1,1,1];
beq=[1];
lb=[];
ub=[];
[x,z]=linprog(f,A,b,Aeq,beq,lb,ub)
