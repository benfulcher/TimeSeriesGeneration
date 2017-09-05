function s = MkSg_noise(distrbn,N,params)
% returns a noisy time series
% Length N
% Sampled from a given distribution distrbn
% with defining parameters params

if nargin<1 || isempty(distrbn)
	distrbn = 'uniform';
end
if nargin<2 || isempty(N)
	N = 1000;
end

% Part of the Make_Signal package
% Ben Fulcher 8/3/2010


switch distrbn
	case 'uniform'
		s = rand(N,1);
	case 'normal'
		s = randn(N,1);
	case 'beta'
		% Uses the MATLAB Statistics Toolbox
		% params specifies a two-component vector [a,b]
		if nargin<3 || isempty(params), params = [1,1]; end
		a = params(1);
		b = params(2);
		s = betarnd(a,b,N,1);
	case 'exp'
		% Uses the MATLAB Statistics Toolbox
		% params specifies the mean parameter mu
		if nargin<3 || isempty(params), params = 1; end
		mu = params;
		s = exprnd(mu,N,1);
	case 'gamma'
		% Uses the MATLAB Statistics Toolbox
		% params specifies the gamma distribution parameters [a,b]
		if nargin<3 || isempty(params), params = [1,5]; end
		a = params(1);
		b = params(2);
		s = gamrnd(a,b,N,1);
	case 'geo'
		% Uses the MATLAB Statistics Toolbox
		% params specifies the probability parameter p
		if nargin<3 || isempty(params), params = 0.5; end
		p = params;
		s = geornd(p,N,1);
	otherwise
		disp('Invalid distribution specified');
		s = NaN;
end


end