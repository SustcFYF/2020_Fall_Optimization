xy = [110 30.3 66.0 98.4 73.7 57.9 86.8 93.6; 
      0 89.8 84.7 76.7 61.0 47.6 22.0 48.8]';
d = zeros(8,8);
for i=1:8
    for j=1:8
        d(i,j)=sqrt((xy(i,1)-xy(j,1))^2+(xy(i,2)-xy(j,2))^2);
    end
end





%% linprog
clc
f=[1,0,0,0,0];
A=[-1,3,2,-1,-1;-1,-2,3,2,-2;-1,1,-3,-2,4;-1,2,0,2,1];
b=[0;0;0;0]; 
Aeq=[0,1,1,1,1];
beq=[1];
lb=[];
ub=[];
[x,z]=linprog(f,A,b,Aeq,beq,lb,ub)