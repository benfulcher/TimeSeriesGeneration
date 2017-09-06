function dx = F_Sprott3dcf_I(t,x)
% Sprott's 3d chaotic flows: I

dx=zeros(3,1);
dx(1) = -0.2*x(2);
dx(2) = x(1)+x(3);
dx(3) = x(1)+x(2)^2-x(3);

end
