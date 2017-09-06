function dx = F_Sprott3dcf_N(t,x)
% Sprott's 3d chaotic flows: N

dx=zeros(3,1);
dx(1) = -2*x(2);
dx(2) = x(1)+x(3)^2;
dx(3) = 1+x(2)-2*x(3);

end
