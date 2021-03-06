%% p1
fun=@(x) x(1)^2+x(2)^2-x(1)*x(2)-2*x(1)+3*x(3);
Aeq=[1,1,1];
beq=3;
A=[1,5,0];
b=6;
x0=[2,0,1];
[x,y]=fmincon(fun,x0,A,b,Aeq,beq,[0,0,0])

%% p2
fun=@(x) 2*x(1)-2*x(2)+3*x(3);
Aeq=[1,1,1];
beq=3;
A=-[1,5,0];
b=-6;
x0=[2,0,1];
[x,y]=linprog([1.75,-0.75,0],A,b,Aeq,beq,[0,0,0])