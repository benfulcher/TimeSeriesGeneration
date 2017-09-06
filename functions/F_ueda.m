function dy = F_ueda(t,y,params)
% Ueda attractor uses:

if nargin<3 || isempty(params)
	params = [7.5, 0.05, 1]; % [A, b, Omega]
end
% A=7.5; b=0.05; Omega=1;
A = params(1);
b = params(2);
Omega = params(3);


% Initialize
dy = zeros(2,1);
% Evaluate
dy(1) = y(2);
dy(2) = -b*y(2) - y(1)^3 + A*sin(Omega*t);

end
