%% problem 1
f=-[3,2];
Aeq=[];
beq=[]; 
A=[2,3;2,1];
b=[14;9];
lb=zeros(2,1);
ub=[];
[x,z]=linprog(f,A,b,Aeq,beq,lb,ub)

f=-[3,2];
Aeq=[1,0];
beq=[4]; 
A=[2,3;2,1];
b=[14;9];
lb=zeros(2,1);
ub=[];
[x,z]=linprog(f,A,b,Aeq,beq,lb,ub)

f=-[3,2];
Aeq=[1,0];
beq=[3]; 
A=[2,3;2,1];
b=[14;9];
lb=zeros(2,1);
ub=[];
[x,z]=linprog(f,A,b,Aeq,beq,lb,ub)

f=-[3,2];
Aeq=[1,0;0,1];
beq=[4;1]; 
A=[2,3;2,1];
b=[14;9];
lb=zeros(2,1);
ub=[];
[x,z]=linprog(f,A,b,Aeq,beq,lb,ub)

f=-[3,2];
Aeq=[1,0;0,1];
beq=[3;2]; 
A=[2,3;2,1];
b=[14;9];
lb=zeros(2,1);
ub=[];
[x,z]=linprog(f,A,b,Aeq,beq,lb,ub)

f=-[3,2];
Aeq=[1,0;0,1];
beq=[3;3];
A=[2,3;2,1];
b=[14;9];
lb=zeros(2,1);
ub=[];
[x,z]=linprog(f,A,b,Aeq,beq,lb,ub)

%% problem 2
f=-[1,1];
Aeq=[];
beq=[]; 
A=[2,1;4,5];
b=[6,20];
lb=zeros(2,1);
ub=[];
[x,z]=linprog(f,A,b,Aeq,beq,lb,ub)

f=-[1,1];
Aeq=[1,0];
beq=[1]; 
A=[2,1;4,5];
b=[6,20];
lb=zeros(2,1);
ub=[];
[x,z]=linprog(f,A,b,Aeq,beq,lb,ub)

f=-[1,1];
Aeq=[1,0];
beq=[2];
A=[2,1;4,5];
b=[6,20];
lb=zeros(2,1);
ub=[];
[x,z]=linprog(f,A,b,Aeq,beq,lb,ub)

f=-[1,1];
Aeq=[1,0;0,1];
beq=[1;3]; 
A=[2,1;4,5];
b=[6,20];
lb=zeros(2,1);
ub=[];
[x,z]=linprog(f,A,b,Aeq,beq,lb,ub)

f=-[1,1];
Aeq=[1,0;0,1];
beq=[1;4]; 
A=[2,1;4,5];
b=[6,20];
lb=zeros(2,1);
ub=[];
[x,z]=linprog(f,A,b,Aeq,beq,lb,ub)

f=-[1,1];
Aeq=[1,0;0,1];
beq=[2;2]; 
A=[2,1;4,5];
b=[6,20];
lb=zeros(2,1);
ub=[];
[x,z]=linprog(f,A,b,Aeq,beq,lb,ub)
