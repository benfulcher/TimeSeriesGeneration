function s = MkSg_Sprott_map(mapname,N,s0,params,eta)
% returns a time series obtained from given conservative map from the 
% list of maps at the end of Sprott's book.
% Output is a signal, s, that has as each column an output from a co-ordinate of the specified map
% Ben Fulcher 8/3/2010 >> adapted from earlier Ben Fulcher code from February 2009

%% Set broad defaults
if nargin<1 || isempty(mapname)
	mapname = 'Chirikov'; % Henon map
end
if nargin<2 || isempty(N)
	N = 1000; % time series 1000 points long
end
if nargin<5 || isempty(eta)
	eta = 500; % remove transient -- first 500 data points
end
	
% Set other defaults within each specific map

switch mapname
	%%% Sprott Conservative Maps
	case 'Chirikov'
		%% Chirikov (standard) map
		% Sprott conservative map
		% parameter is k
		% Set defaults
		if nargin<3 || isempty(s0), s0 = [0.1,6]; end
		if nargin<4 || isempty(params), params = 1; end
		% Initialize
		x = zeros(N+eta,1);
		y = zeros(N+eta,1);
		% Initial conditions
		x(1) = s0(1);
		y(1) = s0(2);
		% Parameters
		k = params;
		% Simulate the map
		for i = 2:N+eta
            y(i) = mod(y(i-1) + k*sin(x(i-1)), 2*pi);
            x(i) = mod(x(i-1) + y(i), 2*pi);
		end
		% Remove transient
		x = x(1+eta:end);
		y = y(1+eta:end);
		% Package into signal output
		s = [x,y];
		
	case 'Henonqm'
		%% Henon area-preserving quadratic map
		% Sprott conservative map
		% Parameter is alpha
		% Set defaults
		if nargin<3 || isempty(s0), s0 = [0.6,0.13]; end
		if nargin<4 || isempty(params), params = acos(0.24); end
		% Initialize
		x = zeros(N+eta,1);
		y = zeros(N+eta,1);
		% Initial conditions
		x(1) = s0(1);
		y(1) = s0(2);
		% Parameters
		alpha = params;
		% Simulate the map
		for i = 2:N+eta
	        x(i) = x(i-1)*cos(alpha) - (y(i-1) - x(i-1)^2) * sin(alpha);
	        y(i) = x(i-1)*sin(alpha) + (y(i-1) - x(i-1)^2) * cos(alpha);
		end
		% Remove transient
		x = x(1+eta:end);
		y = y(1+eta:end);
		% Package into signal output
		s = [x,y];
		
	case 'Arnold'
		%% Arnold's cat map
		% Sprott conservative map
		% Set defaults
		if nargin<3 || isempty(s0), s0=[0,1/sqrt(2)]; end % normal initial conditions
		if nargin<4 || isempty(params), params = 2; end % k=2, normal
		% Initialize
		x = zeros(N+eta,1);
		y = zeros(N+eta,1);
		% Initial conditions
		x(1) = s0(1);
		y(1) = s0(2);
		% Parameters
		k = params;
		% Simulate the map
		for i=2:N+eta
	        x(i) = mod(x(i-1) + y(i-1), 1);
	        y(i) = mod(x(i-1) + k*y(i-1), 1);
		end
		% Remove transient
		x = x(1+eta:end);
		y = y(1+eta:end);
		% Package into signal output
		s = [x,y];
		
	case 'Gingerbreadman'
		%% Gingerbreadman map
		% Sprott conservative map
		% Set defaults
		if nargin<3 || isempty(s0), s0=[0.51,3.7]; end % initial conditions
		% Initialize
		x = zeros(N+eta,1);
		y = zeros(N+eta,1);
		% Initial conditions
		x(1) = s0(1);
		y(1) = s0(2);
		% <No parameters>
		% Simulate the map
		for i=2:N+eta
	        x(i) = 1 + abs(x(i-1)) - y(i-1);
	        y(i) = x(i-1);
		end
		% Remove transient
		x = x(1+eta:end);
		y = y(1+eta:end);
		% Package into signal output
		s = [x,y];

	case 'Chaoticweb'
		%% Chaotic web map
		% Sprott conservative map
		% Set defaults
		if nargin<3 || isempty(s0), s0=[0,2.98]; end % initial conditions
		if nargin<4 || isempty(params), params = [pi/2, 1]; end % alpha = pi/2, k = 1
		% Initialize
		x = zeros(N+eta,1);
		y = zeros(N+eta,1);
		% Initial conditions
		x(1) = s0(1);
		y(1) = s0(2);
		% Parameters
		alpha = params(1);
		k = params(2);
		% Simulate the map
		for i=2:N+eta
	        x(i) = x(i-1)*cos(alpha) - (y(i-1) + k*sin(x(i-1))) * sin(alpha);
	        y(i) = x(i-1)*sin(alpha) + (y(i-1) + k*sin(x(i-1))) * cos(alpha);
		end
		% Remove transient
		x = x(1+eta:end);
		y = y(1+eta:end);
		% Package into signal output
		s = [x,y];

	case 'Lorenz3d'
		%% Lorenz 3D chaotic map
		% Sprott conservative map
		% Set defaults
		if nargin<3 || isempty(s0), s0=[0.5,0.51,-0.99]; end % initial conditions
		% Initialize
		x = zeros(N+eta,1);
		y = zeros(N+eta,1);
		z = zeros(N+eta,1);
		% Initial conditions
		x(1) = s0(1);
		y(1) = s0(2);
		z(1) = s0(3);
		% < No Parameters >
		% Simulate the map
		for i=2:N+eta		
		    x(i) = x(i-1)*y(i-1)-z(i-1);
		    y(i) = x(i-1);
		    z(i) = y(i-1);
		end
		% Remove transient
		x = x(1+eta:end);
		y = y(1+eta:end);
		z = z(1+eta:end);
		% Package into signal output
		s = [x,y,z];
		
%%% Sprott: Dissipative Maps
	case 'Henon'
		%% Henon map
		% Sprott dissipative map
		% Set defaults
		if nargin<3 || isempty(s0), s0=[0.1,0.8]; end % initial conditions
		if nargin<4 || isempty(params), params = [1.4, 0.3]; end % a=1.4, b=0.3 (nominal)
		% Initialize
		x = zeros(N+eta,1);
		y = zeros(N+eta,1);
		% Initial conditions
		x(1) = s0(1);
		y(1) = s0(2);
		% Parameters
		a = params(1);
		b = params(2);
		% Simulate the map
		for i=2:N+eta
	        x(i) = 1 - a*x(i-1)^2 + b*y(i-1);
	        y(i) = x(i-1);
		end
		% Remove transient
		x = x(1+eta:end);
		y = y(1+eta:end);
		% Package into signal output
		s = [x,y];
		
	case 'Lozi'
		%% Lozi map
		% Sprott dissipative map
		% Set defaults
		if nargin<3 || isempty(s0), s0=[-0.2,0.1]; end % initial conditions
		if nargin<4 || isempty(params), params = [1.7, 0.5]; end % a=1.4, b=0.3 (nominal)
		% Initialize
		x = zeros(N+eta,1);
		y = zeros(N+eta,1);
		% Initial conditions
		x(1) = s0(1);
		y(1) = s0(2);
		% Parameters
		a = params(1);
		b = params(2);
		% Simulate the map
		for i = 2:N+eta
	        x(i) = 1 - a*abs(x(i-1)) + b*y(i-1);
	        y(i) = x(i-1);
		end
		% Remove transient
		x = x(1+eta:end);
		y = y(1+eta:end);
		% Package into signal output
		s = [x,y];
		
	case 'DelayedLogistic'
		%% Delayed logistic map
		% Sprott dissipative map
		% Set defaults
		if nargin<3 || isempty(s0), s0=[0.001,0.001]; end % initial conditions
		if nargin<4 || isempty(params), params = 2.27; end % A=2.27 (nominal)
		% Initialize
		x = zeros(N+eta,1);
		y = zeros(N+eta,1);
		% Initial conditions
		x(1) = s0(1);
		y(1) = s0(2);
		% Parameters
		A = params;
		% Simulate the map
		for i=2:N+eta
	        x(i) = A*x(i-1)*(1-y(i-1));
	        y(i) = x(i-1);
		end
		% Remove transient
		x = x(1+eta:end);
		y = y(1+eta:end);
		% Package into signal output
		s = [x,y];

	case 'Tinkerbell'
		%% Tinkerbell map
		% Sprott dissipative maps
		% Set defaults
		if nargin<3 || isempty(s0), s0=[0.1,0.4]; end % initial conditions
		if nargin<4 || isempty(params), params = [0.9, -0.6, 2, 0.5]; end % a,b,c,d -- all nominal
		% Initialize
		x = zeros(N+eta,1);
		y = zeros(N+eta,1);
		% Initial conditions
		x(1) = s0(1);
		y(1) = s0(2);
		% Parameters
		a = params(1);
		b = params(2);
		c = params(3);
		d = params(4);
		% Simulate the map
		for i=2:N+eta
	        x(i) = x(i-1)^2 - y(i-1)^2 + a*x(i-1) + b*y(i-1);
	        y(i) = 2*x(i-1)*y(i-1) + c*x(i-1) + d*y(i-1);
		end
		% Remove transient
		x = x(1+eta:end);
		y = y(1+eta:end);
		% Package into signal output
		s = [x,y];
		
	case 'Burgers'
		%% Burgers map
		% Sprott dissipative maps
		% Set defaults
		if nargin<3 || isempty(s0), s0=[-0.2,0.1]; end % initial conditions
		if nargin<4 || isempty(params), params = [0.75, 1.75]; end % a,b -- nominal
		% Initialize
		x = zeros(N+eta,1);
		y = zeros(N+eta,1);
		% Initial conditions
		x(1) = s0(1);
		y(1) = s0(2);
		% Parameters
		a = params(1);
		b = params(2);
		% Simulate the map
		for i=2:N+eta
	        x(i) = a*x(i-1) - y(i-1)^2;
	        y(i) = b*y(i-1) + x(i-1)*y(i-1);
		end
		% Remove transient
		x = x(1+eta:end);
		y = y(1+eta:end);
		% Package into signal output
		s = [x,y];

	case 'HolmesCubic'
		%% Holmes Cubic map
		% Sprott dissipative maps
		% Set defaults
		if nargin<3 || isempty(s0), s0 = [1.7,0]; end % initial conditions
		if nargin<4 || isempty(params), params = [0.2, 2.77]; end % b,d -- nominal
		% Initialize
		x = zeros(N+eta,1);
		y = zeros(N+eta,1);
		% Initial conditions
		x(1) = s0(1);
		y(1) = s0(2);
		% Parameters
		b = params(1);
		d = params(2);
		% Simulate the map
		for i=2:N+eta
	        x(i) = y(i-1);
	        y(i) = -b*x(i-1) + d*y(i-1) - y(i-1)^3;
		end
		% Remove transient
		x = x(1+eta:end);
		y = y(1+eta:end);
		% Package into signal output
		s = [x,y];
		
	case 'KaplanYorke'
		%% Kaplan-Yorke map
		% Sprott dissipative maps
		% Set defaults
		if nargin<3 || isempty(s0), s0=[1/sqrt(2),-0.4]; end % initial conditions (usual)
		if nargin<4 || isempty(params), params = [1.99999999, 0.2]; end % a,b -- nominal
		% Initialize
		x = zeros(N+eta,1);
		y = zeros(N+eta,1);
		% Initial conditions
		x(1) = s0(1);
		y(1) = s0(2);
		% Parameters
		a = params(1);
		b = params(2);
		% Simulate the map
		for i=2:N+eta
	        x(i) = mod(a*x(i-1),1);
	        y(i) = mod(b*y(i-1) + cos(4*pi*x(i-1)), 1);
		end
		% Remove transient
		x = x(1+eta:end);
		y = y(1+eta:end);
		% Package into signal output
		s = [x,y];

	case 'DissipativeStandard'
		%% Dissipative Standard map
		% Sprott dissipative maps
		% Set defaults
		if nargin<3 || isempty(s0), s0=[1/sqrt(2),-0.4]; end % initial conditions (usual)
		if nargin<4 || isempty(params), params = [0.1, 8.8]; end % b,k -- nominal
		% Initialize
		x = zeros(N+eta,1);
		y = zeros(N+eta,1);
		% Initial conditions
		x(1) = s0(1);
		y(1) = s0(2);
		% Parameters
		b = params(1);
		k = params(2);
		% Simulate the map
		for i=2:N+eta
	        y(i) = mod(b*y(i-1) + k*sin(x(i-1)), 2*pi);
	        x(i) = mod(x(i-1) + y(i),2*pi);
		end
		% Remove transient
		x = x(1+eta:end);
		y = y(1+eta:end);
		% Package into signal output
		s = [x,y];
		
	case 'Ikeda'
		%% Ikeda map
		% Sprott dissipative maps
		% Set defaults
		if nargin<3 || isempty(s0), s0=[0.05,0]; end % initial conditions
		if nargin<4 || isempty(params), params = [6, 0.4, 1, 0.9]; end % alpha, beta, gamma, mu -- nominal
		% Initialize
		x = zeros(N+eta,1);
		y = zeros(N+eta,1);
		% Initial conditions
		x(1) = s0(1);
		y(1) = s0(2);
		% Parameters
		alpha = params(1);
		beta = params(2);
		gamma = params(3);
		mu = params(4);
		% Simulate the map
		for i=2:N+eta
	        theta = beta - alpha/(1 + x(i-1)^2 + y(i-1)^2);
	        x(i) = gamma + mu*(x(i-1)*cos(theta) - y(i-1)*sin(theta));
	        y(i) = mu*(x(i-1)*sin(theta) + y(i-1)*cos(theta));
		end
		% Remove transient
		x = x(1+eta:end);
		y = y(1+eta:end);
		% Package into signal output
		s = [x,y];
		
	case 'Sinai'
		%% Sinai map
		% Sprott dissipative maps
		% Set defaults
		if nargin<3 || isempty(s0), s0=[0.5,0.5]; end % initial conditions
		if nargin<4 || isempty(params), params = 0.10; end % delta
		% Initialize
		x = zeros(N+eta,1);
		y = zeros(N+eta,1);
		% Initial conditions
		x(1) = s0(1);
		y(1) = s0(2);
		% Parameters
		delta = params;
		% Simulate the map
		for i=2:N+eta
	        x(i) = mod(x(i-1) + y(i-1) + delta*cos(2*pi*y(i-1)), 1);
	        y(i) = mod(x(i-1) + 2*y(i-1),1);
		end
		% Remove transient
		x = x(1+eta:end);
		y = y(1+eta:end);
		% Package into signal output
		s = [x,y];
		
	case 'PredatorPrey'
		%% Discrete Predator-Prey Map
		% Sprott dissipative maps
		% Set defaults
		if nargin<3 || isempty(s0), s0=[0.5,0.5]; end % initial conditions
		if nargin<4 || isempty(params), params = [0.3, 1, 5]; end % r, K, alpha (normal)
		% Initialize
		x = zeros(N+eta,1);
		y = zeros(N+eta,1);
		% Initial conditions
		x(1) = s0(1);
		y(1) = s0(2);
		% Parameters
		r = params(1);
		K = params(2);
		alpha = params(3);
		% Simulate the map
		for i=2:N+eta
	        x(i) = x(i-1)*exp(r*(1 - x(i-1)/K) - alpha*y(i-1));
	        y(i) = x(i-1)*(1 - exp(-alpha*y(i-1)));
		end
		% Remove transient
		x = x(1+eta:end);
		y = y(1+eta:end);
		% Package into signal output
		s = [x,y];
		
		%%% Autoregressive Maps
	case 'FreitasStochasticSine'
		%% Freitas stochastic sine map
		% Map from the literature: Freitas, Letellier, Aguirre: PRE 79,035201(R) (2009)
		% x_{n+1},0 = mu*sin(x_n) + Y_n*eta_n
		% Y_n is Bernoulii: y=binornd(1,q,[]) q is the probability y=1
		% eta is (cts) uniform random: eta=unifrnd(-b,b,[]) with magnitude b
		% So when q=0, it's a sine map on a period-2 limit cycle, otherwise it 
		% occasionally gets kicked, perhaps to another limit cycle (there are two fixed
		% points -- at -2 and at 2)
		
		% Set defaults
		if nargin<3 || isempty(s0), s0 = unifrnd(-1,1,1); end % initial conditions
		if nargin<4 || isempty(params), params = [2.4, 1, 0.1]; end % mu, b, q
		% Parameters
		mu = params(1); % amplitude of sine
		b = params(2); % amplitude of noise
		q = params(3); % probability of random kick occurring
		% Initialize
		x = zeros(N+eta,1);
        y = binornd(1,q,[N+eta, 1]);
		n = unifrnd(-b,b,[N+eta, 1]);
		% Initial condition
		x(1) = s0;
		% Simulate the map
        for i = 2:N+eta
            x(i) = mu*sin(x(i-1)) + y(i)*n(i);
        end
		% Remove transient
		x = x(1+eta:end);
		% Package into signal output, s
		s = x;

	case 'FreitasNonlinearMA'
		%% Freita's Nonlinear Moving Average Filter
		% Map from the literature: Freitas, Letellier, Aguirre: PRE 79,035201(R) (2009)
		% A nonlinear moving average filter of uniform random noise:
		% x_{n},0 = a*u_n + b*u_{n-1},0*(1-u_n)
		% The paper didn't give values for the parameters a and b:
		% I have just used uniform random numbers for both a and b between -5 and 5,
		% Getting a new value at each iteration, and with each interation receiving two occurances [1 2]
		% initial condition is also uniform continuous random [-5 5]
		
		% Set defaults
		if nargin<3 || isempty(s0), s0 = unifrnd(-5,5,1); end % initial conditions
		if nargin<4 || isempty(params), params = [2, 1]; end % a, b
		% Initialize
		x = zeros(N+eta,1);
		u = unifrnd(0,1,[N+eta 1]);
		% Initial conditions
		x(1) = s0;
		% Parameters
		a = params(1);
		b = params(2);
		% Simulate the map
        for i=2:N+eta
            x(i) = a*u(i) + b*u(i-1)*(1-u(i));  
        end
		% Remove transient
		x = x(1+eta:end);
		% Package into signal output, s
		s = x;

	case 'CaoPeriodic'
		%% Cao Periodic Map
		% To show his method for determining the dimension he uses this four-dimensional system:
		% x_{n+4},0 = sin(x_n+5) + sin(2x_{n+1},0+5) + sin(3x_{n+2},0+5) + sin(4x_{n+3},0+5)
		% Not quite autoregressive... Nonlinear autoregressive maybe?
		% Set defaults
		if nargin<3 || isempty(s0), s0 = rand(4,1); end % initial conditions (4 of them)
		% Initialize
        x = zeros(N+eta,1);
		% Initial conditions
        x(1:4) = s0;
		% Simulate the map
        for i=5:N+eta
            x(i) = sin(x(i-4)+5) + sin(2*x(i-3)+5) + sin(3*x(i-2)+5) + sin(4*x(i-1)+5);
        end
		% Remove transient
		x = x(1+eta:end);
		% Package into signal output, s
		s = x;
		
	otherwise
		disp(['Invalid map name']);
		s = NaN;
		return
end



end