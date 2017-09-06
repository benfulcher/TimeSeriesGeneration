function dx = F_VanderPol(t,x)
% Van der Pol equation
% b=1;
global b A Omega
dx=zeros(2,1);
dx(1) = x(2);
dx(2) = -b*(x(1)^2-1)*x(2)-x(1)+A*sin(Omega*t);

end
