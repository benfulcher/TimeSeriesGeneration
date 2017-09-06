function dx = F_burkeshaw(t,x,params)
% Burke-Shaw attractor

if nargin<3 || isempty(params)
	params = [10, 13]; % [U, V]
end

U = params(1);
V = params(2);

% Initialize
dx = zeros(3,1);

% Evaluate
dx(1) = -U*x(1) - U*x(2);
dx(2) = -U*x(1)*x(3) - x(2);
dx(3) = -U*x(1)*x(2) + V;

end
