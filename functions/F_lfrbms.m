function dx = F_lfrbms(t,x)
% Linear feedback rigid body motion system
alpha=0.175;

dx=zeros(3,1);

dx(1) = -0.4*x(1) + x(2) + 10*x(2)*x(3);
dx(2) = -x(1) - 0.4*x(2) + 5*x(1)*x(2);
dx(3) = alpha*x(3) - 5*x(1)*x(2);

end
