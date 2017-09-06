function dx = F_Sprott3dcf_R(t,x)
% Sprott's 3d chaotic flows: R

dx=zeros(3,1);
dx(1) = 0.9-x(2);
dx(2) = 0.4+x(3);
dx(3) = x(1)*x(2)-x(3);

end
