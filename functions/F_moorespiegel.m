function dx = F_moorespiegel(t,x,params)
% Moore-Spiegel Oscillator

if nargin<3 || isempty(params)
	params = [6, 20]; % [T, R]
end
T = params(1);
R = params(2);
% T=6;R=20;

% Initialize
dx = zeros(3,1);
% Evaluate
dx(1) = x(2);
dx(2) = x(3);
dx(3) = -x(3)-(T-R+R*x(1)^2)*x(2) - T*x(1);

end
