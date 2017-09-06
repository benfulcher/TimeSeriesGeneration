function dx = F_Jerk3(t,x)
% Third Jerk Equation
global A

dx=zeros(3,1);
dx(1) = x(2);
dx(2) = x(3);
dx(3) = -A*x(3)+(x(2))^2-x(1);

end
