function [x, beta] = rmpnoise(H, N, varargin)
% Generate samples of self-similar time series with Hurst exponent H, using
% the random midpoint displacement method. The output is approximately
% fractional Brownian motion of scaling H, with power law spectrum
% 1/f^beta with beta = [[2*H-1]] 2H+1. Then the detrended fluctuation analysis
% scaling exponent alpha = H. Differencing the output produces approximate
% fractional Gaussian noise with scaling H and beta = [[2*H+1]] 2H-1, and
% alpha = H-1.
%
% Useage:
%  x = rmpnoise(H, N)
%  x = rmpnoise(H, N, 'option')
%
% Inputs:
%  H - Hurst exponent
%  N - number of samples to generate
%
% Output:
%  x    - N x 1 vector of 
%  beta - equivalent 1/f^beta power law spectrum beta value
%
% By specifying the 'normalize' option string forces scaling of the output
% to the range [-1, 1]
%
% (cc) Max Little, 2009. This software is licensed under the
% Attribution-Share Alike 2.5 Generic Creative Commons license:
% http://creativecommons.org/licenses/by-sa/2.5/
% If you use this work, please cite:
% Little MA et al. (2007), "Exploiting nonlinear recurrence and fractal
% scaling properties for voice disorder detection", Biomed Eng Online, 6:23

opt_normal = false;
if ((nargin == 3) && (strcmp(varargin{end},'normalize')))
    opt_normal = true;
end

beta = 2*H+1;

L = ceil(log2(N));
M = 2^L;
x(1,1) = 0;
x(M+1,1) = 0;
x(2:M) = randn(M-1,1);
sigma = sqrt(1-2^(2*H-2));
for i = 1:L
    d = 2^(L-i);
    sigma = sigma/2^H;
    range = (d+1):(2*d):(M-d+1);
    x(range) = 0.5*(x(range-d)+x(range+d))+x(range)*sigma;
end
x = x(1:N);

if (opt_normal)
    x = ((x - min(x))/(max(x) - min(x)) - 0.5) * 2;
end
