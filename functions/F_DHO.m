function dx = F_DHO(t,x)
% A Driven Pendulum
global b A Omega omega

dx=zeros(2,1);
dx(1) = x(2);
dx(2) = -b*x(2)-omega^2*x(1)+A*sin(Omega*t);

end
