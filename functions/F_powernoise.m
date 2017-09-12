function x = powernoise(alpha, N, varargin)
% Generate samples of power law noise. The power spectrum
% of the signal scales as f^(-alpha).
%
% Useage:
%  x = powernoise(alpha, N)
%  x = powernoise(alpha, N, 'option1', 'option2', ...)
%
% Inputs:
%  alpha - power law scaling exponent
%  N     - number of samples to generate
%
% Output:
%  x     - N x 1 vector of power law samples
%
% With no option strings specified, the power spectrum is
% deterministic, and the phases are uniformly distributed in the range
% -pi to +pi. The power law extends all the way down to 0Hz (DC)
% component. By specifying the 'randpower' option string however, the
% power spectrum will be stochastic with Chi-square distribution. The
% 'normalize' option string forces scaling of the output to the range
% [-1, 1], consequently the power law will not necessarily extend
% right down to 0Hz.
%
% (cc) Max Little, 2008. This software is licensed under the
% Attribution-Share Alike 2.5 Generic Creative Commons license:
% http://creativecommons.org/licenses/by-sa/2.5/
% If you use this work, please cite:
% Little MA et al. (2007), "Exploiting nonlinear recurrence and fractal
% scaling properties for voice disorder detection", Biomed Eng Online, 6:23
%
% As of 20080323 markup
% If you use this work, consider saying hi on comp.dsp
% Dale B. Dalrymple 

opt_randpow = false;
opt_normal = false;

for j = 1:(nargin-2)
    switch varargin{j}
        case 'normalize', opt_normal = true;
        case 'randpower', opt_randpow = true;
    end
end

N2 = floor(N/2)-1;
f = (2:(N2+1))';
A2 = 1./(f.^(alpha/2));

if (~opt_randpow)
    p2 = (rand(N2,1)-0.5)*2*pi;
    d2 = A2.*exp(1i*p2);
else
    % 20080323
    p2 = randn(N2,1) + 1i*randn(N2,1);
    d2 = A2.*p2;
end

d = [1; d2; 1/((N2+2)^alpha); flipud(conj(d2))];
x = real(ifft(d));

if (opt_normal)
    x = ((x - min(x))/(max(x) - min(x)) - 0.5) * 2;
end
