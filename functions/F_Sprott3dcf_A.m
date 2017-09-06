function dx = F_Sprott3dcf_A(t,x)
% Sprott's 3d chaotic flows: A

% Initialize
dx = zeros(3,1);
% Evaluate
dx(1) = x(2);
dx(2) = -x(1) + x(2)*x(3);
dx(3) = 1 - x(2)^2;

end
