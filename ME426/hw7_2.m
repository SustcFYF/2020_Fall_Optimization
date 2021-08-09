%% problem 1
[x, y] = fmincon('fun1', zeros(3,1), [], [], [], [], zeros(3,1), [], 'fun2', optimset)
%% problem 2
[x, y] = fmincon('fun3', zeros(3,1), [], [], [], [], zeros(3,1), [], 'fun4', optimset)
%% problem 3
[x, y] = fmincon('fun5', zeros(3,1), [], [], [], [], zeros(3,1), [], 'fun6', optimset)
%% function
function f = fun1(x)
f = -(x(1)^3 - x(2)^2 + x(1)*x(3)^2);
end
function [g,h] = fun2(x)
g = 2-5*x(1)^2+x(2)^2+x(3); 
h = x(1)+x(2)^2+x(3)-5;
end
function f = fun3(x)
f = -(100-(x(1)-3)^2-x(2)^4+19*x(3));
end
function [g,h] = fun4(x)
g = 5*x(1)^2-10*x(1)+30*x(2)^2-120*x(2)+90;
h = 60*x(1)+39*x(3)-159;
end
function f = fun5(x)
f = 6*x(1)+40*x(2)+5*x(3);
end
function [g,h] = fun6(x)
g(1) = x(1)*sin(x(2))+9*x(3)-2;
g(2) = -exp(18*x(1)+3*x(2))-14*x(3)+50;
h=0;
end