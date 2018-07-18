function dy = F_lorenz(t,y,params)
% params specifies [sigma, r, b]

% Defaults
if nargin < 3 || isempty(params)
	params = [10, 28, 8/3];
end

% Set parameters
sigma = params(1);
r = params(2);
b = params(3);

% Initialize
dy = zeros(3,1);

% Define the derivative
dy(1) = sigma*(y(2)-y(1));
dy(2) = -y(1)*y(3) + r*y(1) - y(2);
dy(3) = y(1)*y(2) - b*y(3);


end
