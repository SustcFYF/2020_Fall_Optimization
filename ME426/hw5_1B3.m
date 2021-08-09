clear
clc;
%f=@(x) (x(2)-x(1)^2)^2+(1-x(1));
%f=(x2-x1^2)^2+(1-x1)
syms x1 x2 x3;
f=x1^2+x2^2-x1*x2-2*x1+3*x3;
x=[0,0];
ess=0.1;
[k,endpoint]=steepest(f,x,ess)
xlabel('x1')
ylabel('x2')
title('100 times')
box on