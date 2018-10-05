function dx = F_simpdcf(t,x,Omega)
% Simplest driven chaotic flow

if nargin < 3 || isempty(Omega)
	Omega = 1.88;
end

% Initialize:
dx = zeros(2,1);

% Evaluate:
dx(1) = x(2);
dx(2) = -x(1)^3 + sin(Omega*t);

end
