function TSconfigs = generateNoisySineWithLinearTrendConfigs3()
% parameter values to generate the TSconfig for
Tvar = [10     100]; Tfix = 30;
etaVar = [0      0.8]; etaFix =  0;
mVar = [-20     20]; mFix = 0;

% paramsCell = { ...
% %     {tVar;  etaFix; mFix}, ...  1D T
%     {Tfix;  etaVar; mFix}, ...  1D eta
% %     {Tfix;  etaFix; mVar}, ...  1D m
%     {Tvar;  etaVar; mFix}, ...  2D T, eta
%     {Tfix;  etaVar; mVar}, ...  2D eta, m
% %     {Tvar;  etaFix; mVar}, ...  2D T, m
%     {Tvar;  etaVar; mVar}, ...  3D T, eta, m
%     };
% 
% Ns = [ ...
% %     100, ...
% %     100, ...
%     100, ...
%     400, ...
% %     400, ...
%     400, ...
%     1000, ...
%     ];

paramsCell = { ...
    {Tfix;  etaVar; mFix}, ...  1D eta
    {Tvar;  etaVar; mFix}, ...  2D T, eta
    {Tfix;  etaVar; mVar}, ...  2D eta, m
    {Tvar;  etaVar; mVar}, ...  3D T, eta, m
    };

Ns = [ ...
    100, ...
    400, ...
    400, ...
    1000, ...
    ];

TSconfigs = {};
for paramsInd = 1:length(paramsCell)
    TSconfigs = horzcat(TSconfigs, generateNoisySineWithLinearTrendConfig(paramsCell{paramsInd}, Ns(paramsInd)));
end

end

function config = generateNoisySineWithLinearTrendConfig(params, N)

    config.functionName = 'noisySineWithLinearTrend';
    config.signalNames = {'x'};

    config.nRealizations = N;

    config.paramNames = {'T', 'eta', 'm'};
    config.params = params;

    config.timeParamNames = {'steps'};
    config.timeParams = [...
        2500; ...   signal steps
        ];
   
end