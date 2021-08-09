%% function
function [xmin,fmin,k]=newton(f,x0,e) 
syms x1 x2; 
fx=diff(f,x1); 
fy=diff(f,x2);
gf=[fx fy]';

fxx=diff(fx,x1); 
fxy=diff(fx,x2);
fyx=diff(fy,x1); 
fyy=diff(fy,x2);
Hess=[fxx,fxy;fyx,fyy];

xmin=x0'; 
fmin=subs(f,[x1 x2],x0);
gk=subs(gf,[x1 x2],x0);
Hk=subs(Hess,[x1 x2],x0);
k=0;  

while((norm(gk)>e)&&(k<10))
    dk=-Hk\gk;   
    xmin=xmin+dk;     
    fmin=subs(f,[x1 x2],xmin');
    gk=subs(gf,[x1 x2],xmin');
    Hk=subs(Hess,[x1 x2],xmin');
    k=k+1;
end