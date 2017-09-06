function dx = F_chua(t,x,params)
% Chua's circuit

if nargin<3 || isempty(params)
	params = [9, 100/7, 8/7, 5/7]; % [alpha,beta,a,b]
end
alpha = params(1);
beta = params(2);
a = params(3);
b = params(4);

% alpha=9; beta=100/7; a=8/7; b=5/7;

% Initialize
dx = zeros(3,1);
% Evaluate
dx(1) = alpha*(x(2) - x(1) + b*x(1) + 0.5*(a-b)*(abs(x(1)+1)-abs(x(1)-1)));
dx(2) = x(1) - x(2) + x(3);
dx(3) = -beta*x(2);

end
