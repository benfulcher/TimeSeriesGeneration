function dx = F_Sprott3dcf_O(t,x)
% Sprott's 3d chaotic flows: O

dx=zeros(3,1);
dx(1) = x(2);
dx(2) = x(1)-x(3);
dx(3) = x(1)+x(1)*x(3)+2.7*x(2);

end
