function dx = F_Sprott3dcf_M(t,x)
% Sprott's 3d chaotic flows: M

dx=zeros(3,1);
dx(1) = -x(3);
dx(2) = -x(1)^2-x(2);
dx(3) = 1.7+1.7*x(1)+x(2);

end
