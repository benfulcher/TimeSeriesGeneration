function dx = F_Sprott3dcf_C(t,x)
% Sprott's 3d chaotic flows: C

dx=zeros(3,1);
dx(1) = x(2)*x(3);
dx(2) = x(1)-x(2);
dx(3) = 1-x(1)^2;

end
