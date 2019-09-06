function dx = F_vdp(t,x,params)
% van der Pol oscillator

if nargin<3 || isempty(params)
	params = [1, 1]; % [c, k]
end
c = params(1);
k = params(2);

% Initialize
dx = zeros(2,1);
% Evaluate
dx(1) = x(2);
dx(2) = c*(1-x(1)^2)*x(2) - k*x(1);

end
