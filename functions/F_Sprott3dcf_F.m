function dx = F_Sprott3dcf_F(t,x)
% Sprott's 3d chaotic flows: F

dx=zeros(3,1);
dx(1) = x(2)+x(3);
dx(2) = -x(1)+0.5*x(2);
dx(3) = x(1)^2-x(3);

end
