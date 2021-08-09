function [g,h] = fun2(x)
g = 2-5*x(1)^2+x(2)^2+x(3); 
h = x(1)+x(2)^2+x(3)-5;
end