function s = MkSg_Flow(flowname,N,L,s0,params,eta)
% returns a time series obtained from a given flow
% Output is a signal, s, that has as each column an output from a co-ordinate of the specified flow
% Ben Fulcher 8/3/2010 >> adapted from earlier Ben Fulcher code from February 2009

%% Set broad defaults
if nargin<1 || isempty(flowname)
	flowname = 'Lorenz'; % Lorenz attractor
end
if nargin<5
	params = []; % use defaults specified in function file
end
if nargin<6 || isempty(eta)
	eta = 500; % remove transient -- first 500 data points
end

% Set evaluation/sensitivity options
opts = odeset('reltol',10^-6,'abstol',10^-6);

% Set other defaults for each specific case

% Specify the ode (as ode), points (as N), length scale (as L) and initial conditions (as s0) for each case
switch flowname
	case 'Lorenz'
	 	%% Lorenz Attractor
		% Sprott Autonomous Dissipative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/5); end
		if nargin<4 || isempty(s0), s0 = [0; -0.01; 20]; end
		ode = @(t,y) F_lorenz(t,y,params); % Specify the ODE

	case 'Rossler'
		%% Rössler Attractor
		% Sprott Autonomous Dissipative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/5); end
		if nargin<4 || isempty(s0), s0 = [-9; 0; 0]; end
		ode = @(t,y) F_rossler(t,y,params); % Specify the ODE

	case 'DiffnLorenz'
		%% Diffusionless Lorenz Attractor
		% Sprott Autonomous Dissipative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/5); end
		if nargin<4 || isempty(s0), s0 = [0; -0.01; 20]; end
		ode = @(t,y) F_diffnlorenz(t,y,params); % Specify the ODE
		
	case 'ComplexButterfly'
		%% Complex Butterfly
		% Sprott Autonomous Dissipative Flows
		if nargin<2 || isempty(N), N = 5000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.2; 0; 0]; end
		ode = @(t,y) F_complxbutfly(t,y,params); % Specify the ODE
		
	case 'Chen'
		%% Chen's System
		% Sprott Autonomous Dissipative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/4); end
		if nargin<4 || isempty(s0), s0 = [-10; 0; 37]; end
		ode = @(t,y) F_chen(t,y,params); % Specify the ODE
		
	case 'Hadley'
		%% Hadley circulation
		% Sprott Autonomous Dissipative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/100); end
		if nargin<4 || isempty(s0), s0 = [0; 0; 1.3]; end
		ode = @(t,y) F_hadley(t,y,params); % Specify the ODE

	case 'ACT'
		%% ACT attractor
		% Sprott Autonomous Dissipative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/10); end
		if nargin<4 || isempty(s0), s0 = [0.5; 0; 0]; end
		ode = @(t,y) F_ACT(t,y,params); % Specify the ODE
		
	case 'RabFab'
		%% Rabinovich-Fabrikant attactor
		% Sprott Autonomous Dissipative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/10); end
		if nargin<4 || isempty(s0), s0 = [-1; 0; 0.5]; end
		ode = @(t,y) F_rabfab(t,y,params); % Specify the ODE

	case 'lfrbms'
		%% Linear feedback rigid body motion system (faulty)
		% Sprott Autonomous Dissipative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/5); end
		if nargin<4 || isempty(s0), s0 = [0.6; 0; 0]; end
		ode = @(t,y) F_lfrbms(t,y,params); % Specify the ODE
		% ------Can't get it to work----------
		
	case 'Chua'
		%% Chua's circuit
		% Sprott Autonomous Dissipative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/5); end
		if nargin<4 || isempty(s0), s0 = [0; 0; 0.6]; end
		ode = @(t,y) F_chua(t,y,params); % Specify the ODE
		
	case 'MooreSpiegel'
		%% Moore-Spiegel oscillator
		% Sprott Autonomous Dissipative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/10); end
		if nargin<4 || isempty(s0), s0 = [0.1; 0; 0]; end
		ode = @(t,y) F_moorespiegel(t,y,params); % Specify the ODE

	case 'thomascsa'
		%% Thomas' cyclically symmetric attractor
		% Sprott Autonomous Dissipative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.1; 0; 0]; end
		ode = @(t,y) F_thomascsa(t,y,params); % Specify the ODE

	case 'halvorsencsa'
		%% Halvorsen's cyclically symmetric attractor
		% Sprott Autonomous Dissipative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/10); end
		if nargin<4 || isempty(s0), s0 = [-5; 0; 0]; end
		ode = @(t,y) F_halvorsencsa(t,y,params); % Specify the ODE
		
	case 'BurkeShaw'
		%% Burke-Shaw attractor (doesn't work)
		% Sprott Autonomous Dissipative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/5); end
		if nargin<4 || isempty(s0), s0 = [0.6; 0; 0]; end
		ode = @(t,y) F_burkeshaw(t,y,params); % Specify the ODE
		% ------- Can't get it to work -----------
		
	case 'Rucklidge'
		%% Rucklidge attractor
		% Sprott Autonomous Dissipative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/10); end
		if nargin<4 || isempty(s0), s0 = [1; 0; 4.5]; end
		ode = @(t,y) F_rucklidge(t,y,params); % Specify the ODE
		
	case 'windmi'
		%% WINDMI attractor
		% Sprott Autonomous Dissipative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0; 0.8; 0]; end
		ode = @(t,y) F_windmi(t,y,params); % Specify the ODE

	case 'simpqcf'
		%% Simplest quadratic chaotic flow
		% Sprott Autonomous Dissipative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [-0.9; 0; 0.5]; end
		ode = @(t,y) F_simpqcf(t,y,params); % Specify the ODE
		
	case 'simpccf'
		%% Simplest cubic chaotic flow
		% Sprott Autonomous Dissipative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0; 0.96; 0]; end
		ode = @(t,y) F_simpccf(t,y,params); % Specify the ODE

	case 'simpplcf'
		%% Simplest piecewise linear chaotic flow
		% Sprott Autonomous Dissipative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0; -0.7; 0]; end
		ode = @(t,y) F_simpplcf(t,y,params); % Specify the ODE

	case 'DoubleScroll'
		%% Double scroll
		% Sprott Autonomous Dissipative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.01; 0.01; 0]; end
		ode = @(t,y) F_dblscroll(t,y,params); % Specify the ODE

%%% Sprott's Conservative Flows
	case 'DrivenPend'
		%% Driven Pendulum
		% Sprott's Conservative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0; 0]; end
		ode = @(t,y) F_drivenpend(t,y,params); % Specify the ODE

	case 'simpdcf'
		%% Simplest Driven Chaotic Flow
		% Sprott's Conservative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = N; end
		if nargin<4 || isempty(s0), s0 = [0; 0]; end
		ode = @(t,y) F_simpdcf(t,y,params); % Specify the ODE
	
	case 'nosehoover'
		%% Nose-Hoover Oscillator
		% Sprott's Conservative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = N; end
		if nargin<4 || isempty(s0), s0 = [0; 5; 0]; end
		ode = @(t,y) F_nosehoover(t,y,params); % Specify the ODE

	case 'labyrinth'
		%% Labyrinth Chaos
		% Sprott's Conservative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = N*2; end
		if nargin<4 || isempty(s0), s0 = [0.1; 0; 0]; end
		% (No parameters)
		ode = @(t,y) F_labyrinth(t,y); % Specify the ODE
		
	case 'henonheiles'
		%% Henon-Heiles System
		% Sprott's Conservative Flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.499; 0; 0; 0.03160676]; end
		% (No parameters)
		ode = @(t,y) F_henonheiles(t,y); % Specify the ODE

%%% Sprott's Dissipative Flows
	case 'DPend'
		%% Damped driven pendulum
		% Sprott's dissipative flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.1; 0.1]; end
		ode = @(t,y) F_DPend(t,y,params); % Specify the ODE

	case 'DvdP'
		%% Driven van der Pol oscillator
		% Sprott's dissipative flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [-1.9; 0.2]; end
		ode = @(t,y) F_DvdP(t,y,params); % Specify the ODE
		
	case 'ShawvdP'
		%% Shaw-van der Pol
		% Sprott's dissipative flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [1.3; 0.1]; end
		ode = @(t,y) F_ShawvdP(t,y,params); % Specify the ODE
		
	case 'FBruss'
		%% Forced Brusselator
		% Sprott's dissipative flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.3; 2]; end
		ode = @(t,y) F_FBruss(t,y,params); % Specify the ODE
		
	case 'Ueda'
		%% Ueda Oscillator
		% Sprott's dissipative flows
		if nargin<2 || isempty(N), N = 1000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [2.5; 0]; end
		ode = @(t,y) F_ueda(t,y,params); % Specify the ODE

	case 'Dufftwowell'
		%% Duffing two-well oscillator
		% Sprott's dissipative flows
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.2; 0]; end
		ode = @(t,y) F_Dufftwowell(t,y,params); % Specify the ODE

	case 'Duffvdp'
		%% Duffing van der Pol oscillator
		% Sprott's dissipative flows
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.2; -2]; end
		ode = @(t,y) F_duffvdp(t,y,params); % Specify the ODE
		
	case 'Rayduff'
		%% Rayleigh-Duffing oscillator
		% Sprott's dissipative flows
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.3; 0]; end
		ode = @(t,y) F_rayduff(t,y,params); % Specify the ODE

%%% Sprott's Simple Jerk Systems
	case 'JD1'
		%% Sprott Jerk 1
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.1; 0; 0]; end
		ode = @(t,y) F_sprottJD1(t,y,params); % Specify the ODE
	case 'JD2'
		%% Sprott Jerk 2
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.1; 0; 0]; end
		ode = @(t,y) F_sprottJD2(t,y,params); % Specify the ODE
	case 'JD3'
		%% Sprott Jerk 3
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.1; 0; 0]; end
		ode = @(t,y) F_sprottJD3(t,y,params); % Specify the ODE
	case 'JD4'
		%% Sprott Jerk 4
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.1; 0; 0]; end
		ode = @(t,y) F_sprottJD4(t,y,params); % Specify the ODE
	case 'JD5'
		%% Sprott Jerk 5
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.1; 0; 0]; end
		ode = @(t,y) F_sprottJD5(t,y,params); % Specify the ODE
	case 'JD6'
		%% Sprott Jerk 6
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.1; 0; 0]; end
		ode = @(t,y) F_sprottJD6(t,y,params); % Specify the ODE
	case 'JD7'
		%% Sprott Jerk 7
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.1; 0; 0]; end
		ode = @(t,y) F_sprottJD7(t,y,params); % Specify the ODE

%%% Sprott's 3D Chaotic FLOWS
% Table 4.1
% All basically parameterless
	case '3dcf_A'
		%% Sprott 3D chaotic flow A
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.05; 0.05; 0.05]; end
		ode = @(t,y) F_Sprott3dcf_A(t,y); % Specify the ODE
	case '3dcf_B'
		%% Sprott 3D chaotic flow B
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.05; 0.05; 0.05]; end
		ode = @(t,y) F_Sprott3dcf_B(t,y); % Specify the ODE	
	case '3dcf_C'
		%% Sprott 3D chaotic flow C
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.05; 0.05; 0.05]; end
		ode = @(t,y) F_Sprott3dcf_C(t,y); % Specify the ODE	
	case '3dcf_D'
		%% Sprott 3D chaotic flow D
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.05; 0.05; 0.05]; end
		ode = @(t,y) F_Sprott3dcf_D(t,y); % Specify the ODE	
	case '3dcf_E'
		%% Sprott 3D chaotic flow E
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.05; 0.05; 0.05]; end
		ode = @(t,y) F_Sprott3dcf_E(t,y); % Specify the ODE	
	case '3dcf_F'
		%% Sprott 3D chaotic flow F
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.05; 0.05; 0.05]; end
		ode = @(t,y) F_Sprott3dcf_F(t,y); % Specify the ODE	
	case '3dcf_G'
		%% Sprott 3D chaotic flow G
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.05; 0.05; 0.05]; end
		ode = @(t,y) F_Sprott3dcf_G(t,y); % Specify the ODE	
	case '3dcf_H'
		%% Sprott 3D chaotic flow H
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.05; 0.05; 0.05]; end
		ode = @(t,y) F_Sprott3dcf_H(t,y); % Specify the ODE	
	case '3dcf_I'
		%% Sprott 3D chaotic flow I
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.05; 0.05; 0.05]; end
		ode = @(t,y) F_Sprott3dcf_I(t,y); % Specify the ODE	
	case '3dcf_J'
		%% Sprott 3D chaotic flow J
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.05; 0.05; 0.05]; end
		ode = @(t,y) F_Sprott3dcf_J(t,y); % Specify the ODE	
	case '3dcf_K'
		%% Sprott 3D chaotic flow K
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.05; 0.05; 0.05]; end
		ode = @(t,y) F_Sprott3dcf_K(t,y); % Specify the ODE	
	case '3dcf_L'
		%% Sprott 3D chaotic flow L
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.05; 10; -4]; end
		ode = @(t,y) F_Sprott3dcf_L(t,y); % Specify the ODE	
	case '3dcf_M'
		%% Sprott 3D chaotic flow M
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.05; 0.05; 0.05]; end
		ode = @(t,y) F_Sprott3dcf_M(t,y); % Specify the ODE	
	case '3dcf_N'
		%% Sprott 3D chaotic flow N
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.05; 0.05; 0.05]; end
		ode = @(t,y) F_Sprott3dcf_N(t,y); % Specify the ODE	
	case '3dcf_O'
		%% Sprott 3D chaotic flow O
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.05; 0.05; 0.05]; end
		ode = @(t,y) F_Sprott3dcf_O(t,y); % Specify the ODE	
	case '3dcf_P'
		%% Sprott 3D chaotic flow P
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.05; 0.05; 0.05]; end
		ode = @(t,y) F_Sprott3dcf_P(t,y); % Specify the ODE	
	case '3dcf_Q'
		%% Sprott 3D chaotic flow Q
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.05; 0.05; 0.05]; end
		ode = @(t,y) F_Sprott3dcf_Q(t,y); % Specify the ODE	
	case '3dcf_R'
		%% Sprott 3D chaotic flow R
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.05; 0.05; 0.05]; end
		ode = @(t,y) F_Sprott3dcf_R(t,y); % Specify the ODE	
	case '3dcf_S'
		%% Sprott 3D chaotic flow S
		if nargin<2 || isempty(N), N = 2000; end
		if nargin<3 || isempty(L), L = round(N/2); end
		if nargin<4 || isempty(s0), s0 = [0.05; 0.05; 0.05]; end
		ode = @(t,y) F_Sprott3dcf_S(t,y); % Specify the ODE

	otherwise
		disp([flowname ' has no matches']); return
end

% Specify the time span
tspan = [1 L+eta];
% Solve
disp(['Solving ' flowname ' ..........']);
tic
sol = ode45(ode, tspan, s0, opts);
disp(['Solving ' flowname ' took ' benrighttime(toc)]);

% Evaluate solution on a discrete grid of points, eliminating the transient
t = linspace(1+eta, L+eta, N);
s = deval(sol,t)';

% Ensure a column vector
if size(s,2)>size(s,1)
    s = s';
end

end
