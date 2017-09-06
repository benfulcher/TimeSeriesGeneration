function dx = F_Sprott3dcf_S(t,x)
% Sprott's 3d chaotic flows: S

dx=zeros(3,1);
dx(1) = -x(1)-4*x(2);
dx(2) = x(1)+x(3)^2;
dx(3) = 1+x(1);

end
