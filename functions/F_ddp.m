function dx = F_ddp(t,x)
% A Damped Driven Pendulum
global b A Omega

dx=zeros(2,1);
dx(1) = x(2);
dx(2) = -b*x(2)-sin(x(1))+A*sin(Omega*t);

end
