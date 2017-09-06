function dx = F_Sprott3dcf_G(t,x)
% Sprott's 3d chaotic flows: G

dx=zeros(3,1);
dx(1) = 0.4*x(1)+x(3);
dx(2) = x(1)*x(3)-x(2);
dx(3) = -x(1)+x(2);

end
