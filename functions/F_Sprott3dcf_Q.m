function dx = F_Sprott3dcf_Q(t,x)
% Sprott's 3d chaotic flows: Q

dx=zeros(3,1);
dx(1) = -x(3);
dx(2) = x(1)-x(2);
dx(3) = 3.1*x(1)+x(2)^2+0.5*x(3);

end
