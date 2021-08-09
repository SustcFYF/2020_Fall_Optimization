%% problem a
clc;
f=@(x) 1/2*((x+1)^3+x^2)^2-3;
df=diff(f,x);
ddf=diff(df,x);
x1=0;
dft=subs(df,x0);
ddft=subs(ddf,x0);
ess=1e-10;
while(dft>ess)
    x1=x1-dft/ddft;
    dft=subs(df,x1);
    ddft=subs(ddf,x1);
 end
xmin=double(x1)
fmin=double(subs(f,xmin))

%% problem b
clear 
clc
x0=[3 6];
ess=1e-10;
syms x1 x2
f=x1*x2-5*(x1-2)^4-3*(x2-5)^4;
[xmax,fmax,k]=newton(f,x0,ess);
xmax=double(xmax)
fmax=double(fmax)

%% problem c
clear 
clc
x0=[1e37 1e37];
ess=1e-10;
syms x1 x2
f=1000/(x1+x2)-(x1-4)^2+(x2-10)^2;
[xmin,fmin,k]=newton(f,x0,ess);
xmin=double(xmin)
fmin=double(fmin)
f1=@(x) 1000/(x(1)+x(2))-(x(1)-4)^2+(x(2)-10)^2;
[x,f1]=fminsearch(f1,[1 1])