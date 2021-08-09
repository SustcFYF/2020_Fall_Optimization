function [g,h] = fun6(x)
g(1) = x(1)*sin(x(2))+9*x(3)-2;
g(2) = -exp(18*x(1)+3*x(2))-14*x(3)+50;
h=0;
end