function s = populationGrowth(r, K, beta, n)

    fprintf('Generationg populationGrowth for r=%1.3f, K=%1.3f, beta=%1.3f\n', ...
        r, K, beta);
        
    % fixed params
    s0 = [1];
    Tend = 30;
    
    % variable params
    params.r = r;
    params.K = K;
    params.beta = beta;
    
    % Set evaluation/sensitivity options
    opts = odeset('reltol',10^-6,'abstol',10^-6);
    
    % Specify the time span
    tspan = [0,Tend];

    % Specify the ODE
    ode = @(t,y) popGrowthStep(t,y,params); 
    
    % Solve the ODE
    sol = ode45(ode,tspan,s0);%,opts);

    % Evaluate solution on a discrete grid of N points
    t = linspace(0, Tend, n);
    s = deval(sol,t)';
    
end

function dx = popGrowthStep(t, x, params)

    r = params.r;
    K = params.K;
    beta = params.beta;

    dx = r*x*(K-x) + beta*x*randn(1);
    
end