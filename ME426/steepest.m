function [k,endpoint]=steepest(f,x,ess)
syms x1 x2 r; 
d=-[diff(f,x1),diff(f,x2)]; 
flag=1;
k=0;
x1last=x(1);
x2last=x(2);
while(flag&& k<10)
    grad=subs(d,x1,x(1));
    grad=double(subs(grad,x2,x(2)));
    nor=norm(grad) 
    if(nor>=ess);
        x_temp=x+r*grad;            
        f_temp=subs(f,x1,x_temp(1));
        f_temp=subs(f_temp,x2,x_temp(2));
        %h=diff(f_temp,r);
        [rmin,~]=fminsearch(matlabFunction(f_temp),0);
        step=rmin;
        x=x+step*grad;
        line([x1last x(1)],[x2last x(2)]);
        x1last=x(1);
        x2last=x(2);
        hold on
        k=k+1;
    else
        flag=0;
    end
end
endpoint=double(x);
end