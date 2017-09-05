function s = MkSg_sine(N,A,f,phi,eta)
% returns a sine wave
% Length N
% Amplitude A
% Frequency f
% Phase offset phi
% Noise amplitude eta

% Part of Make_Signal database
% Ben Fulcher 8/3/2010

%% Set defaults
if nargin<1 || isempty(N)
	N = 1000; % time series of length 1000
end
if nargin<2 || isempty(A)
	A = 1; % amplitude 1
end
if nargin<3 || isempty(f)
	f = 1/20; % frequency 1/20
end
if nargin<4 || isempty(phi)
	phi = 0; % no phase offset
end
if nargin<5 || isempty(eta)
	eta = 0; % no Gaussian random noise
end

%% Make the signal

s = A*sin(2*pi*f*(1:N)' + phi) + eta*randn(N,1);

end