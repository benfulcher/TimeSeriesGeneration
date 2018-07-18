function dx = F_rossler(t,x,params)
% Rössler attractor

if nargin < 3 || isempty(params)
	params = [0.2, 0.2, 5.7]; % [a, b, c]
end

% Set parameters
a = params(1);
b = params(2);
c = params(3);

% Inherited from Michael Small's Rossler function file:
% From Thompson and Stewart:
% limit cycle           a=0.3
% period 2 limit cycle  a=0.35
% period 4              a=0.375
% "four band" chaos     a=0.386
% period 6              a=0.3909
% "single band" chaos   a=0.398
% period 5              a=0.4
% period 3              a=0.411
% ---- b=2;c=4;

% Evaluate the function
dx = zeros(3,1);

dx(1) = -x(2) - x(3);
dx(2) = x(1) + a*x(2);
dx(3) = b + x(3)*(x(1)-c);

end
