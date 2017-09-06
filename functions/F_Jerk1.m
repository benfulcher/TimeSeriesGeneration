function dx = F_Jerk1(t,x)
% First Jerk Equation
global A

dx=zeros(3,1);
dx(1) = x(2);
dx(2) = x(3);
dx(3) = -A*x(3)-x(2)+abs(x(1))-1;

end
