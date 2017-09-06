function dx = F_Dufftwowell(t,x,params)
% A Duffing oscillator

if nargin<3 || isempty(params)
	params = [0.25, 0.4, 1]; % [b, A, Omega]
end
b = params(1);
A = params(2);
Omega = params(3);
% b=0.25; A=0.4; Omega=1;

% Initialize
dx = zeros(2,1);
% Evaluate
dx(1) = x(2);
dx(2) = -x(1)^3 + x(1) - b*x(2) + A*sin(Omega*t);

end
