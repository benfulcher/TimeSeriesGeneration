function dx = F_Sprott3dcf_H(t,x)
% Sprott's 3d chaotic flows: H

dx=zeros(3,1);
dx(1) = -x(2)+x(3)^2;
dx(2) = x(1)+0.5*x(2);
dx(3) = x(1)-x(3);

end
