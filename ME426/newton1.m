function [xk,x0,k]=newton1(a,err,f)
x0=1;%初值大小
newton=@(x)x - (x^3/3-x)/(x^2-1);  %此处的f(x)=x^3/3-x=0
k=0 ; err=1.000;
phi=10^(-4);%允许误差大小
disp('k         x_k             err');
while(err>phi)
    x1=newton(x0);
    err=abs(x1-x0);
    x0=x1;
    k=k+1;
  end
end