function dx = F_DvdP(t,x,params)
% Driven van der Pol oscillator

if nargin<3 || isempty(params)
	params = [3, 5, 1.788]; %[b, A, Omega]
end
b = params(1);
A = params(2);
Omega = params(3);

% b=3;A=5;Omega=1.788;

dx=zeros(2,1);
dx(1) = x(2);
dx(2) = -x(1)+b*(1-x(1)^2)*x(2)+A*sin(Omega*t);

end
