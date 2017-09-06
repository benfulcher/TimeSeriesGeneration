function dx = F_Sprott3dcf_D(t,x)
% Sprott's 3d chaotic flows: D

dx=zeros(3,1);
dx(1) = -x(2);
dx(2) = x(1)+x(3);
dx(3) = x(1)*x(3)+3*x(2)^2;

end
