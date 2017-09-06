function dx = F_Sprott3dcf_L(t,x)
% Sprott's 3d chaotic flows: L

dx=zeros(3,1);
dx(1) = x(2)+3.9*x(3);
dx(2) = 0.9*x(1)^2-x(2);
dx(3) = 1-x(1);

end
