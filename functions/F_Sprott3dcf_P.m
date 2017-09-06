function dx = F_Sprott3dcf_P(t,x)
% Sprott's 3d chaotic flows: P

dx=zeros(3,1);
dx(1) = 2.7*x(2)+x(3);
dx(2) = -x(1)+x(2)^2;
dx(3) = x(1)+x(2);

end
