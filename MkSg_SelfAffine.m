function s = MkSg_SelfAffine(N,alpha,generateHow)
% Generates a self-affine time series
%-------------------------------------------------------------------------------

if nargin < 1
	N = 5000;
end
if nargin < 2
	alpha = 0.5;
end
if nargin < 3
	generateHow = 'powernoise';
end

%-------------------------------------------------------------------------------

switch generateHow
case 'powernoise'
	s = F_powernoise(alpha,N); % deterministic powerlaw-correlated noise
case 'rmpnoise'
	% I think you need to alter to input the Hurst exponent, H:
	H = 0.5*(alpha+1);
	s = F_rmpnoise(H,N); % powerlaw-correlated noise
end

%===============================================================================
% N = 5000;
% alphar = (-1:0.02:4);
% for i = 1:length(alphar)
%     x = powernoise(alphar(i), N); % deterministic powerlaw-correlated noise
%     plot(x(1:500),'.-k');
%     title(alphar(i),'interpreter','none')
%     disp(alphar(i))
%     Y = abs(fft(x)).^2;
%     Y = Y(1:end/2);
%     p = polyfit(log(1:length(Y))',log(Y),1);
%     disp(p(1));
% end
%===============================================================================


end
