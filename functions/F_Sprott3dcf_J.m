function dx = F_Sprott3dcf_J(t,x)
% Sprott's 3d chaotic flows: J

dx=zeros(3,1);
dx(1) = 2*x(3);
dx(2) = -2*x(2)+x(3);
dx(3) = -x(1)+x(2)+x(2)^2;

end
