function s = MkSg_AR(N,params,eta)
% returns an AR time series of mean zero
% Length N
% Transient removed of length eta
% with defining parameters params as a vector (i.e., also specifies order)

if nargin<1 || isempty(N)
	N = 1000;
end
if nargin<2 || isempty(params)
	params = [0.1]; % AR(1) process with parameter 0.1
end
if nargin<3 || isempty(eta)
    eta = 100; % 100 time points removed from intial transient
end

% Part of the Make_Signal package
% Ben Fulcher 29/3/2010


% Make the noise term, eta
% Gaussian distributed (this could be specified as an additional input to
% make this code more general, and it could take that input from
% MkSg_noise). You could even pass general signals in for the noise term 
% and treat this as a filter... In fact, I think you can do all this much
% more elegantly using the filter command in MATLAB... But I'm lazy and
% also enjoy making my own less efficient code.
noise = randn(N+eta,1);
x = zeros(N+eta,1);

order = length(params);
% will need this many initial conditions
% taken from uniform random distribution
% Could do nothing (i.e., take from uniform distribution of zeros)- we're
% removing transient so for the stationary processes, this shouldn't
% matter.
x(1:order) = rand(order,1);

for i=order+1:N+eta
    x(i) = params.*x(i-order:i-1) + noise(i);
end

s = x(eta+1:end);

end