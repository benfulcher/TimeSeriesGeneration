function TSconfigs = generateNoisySineWithLinearTrendConfigs()
% parameter values to generate the TSconfig for
%T;      [10     100]    or 30
%eta;    [0      3]      or 0
%m;      [-5     5]      or 0

paramsCell = { ...
    {[10 100];  0;      0}, ...         1D T
    {30;        [0 3];  0}, ...         1D eta
    {30;        0;      [-5 5]}, ...    1D m
    {[10 100];  [0 3];  0}, ...         2D T, eta
    {30;        [0 3];  [-5 5]}, ...    2D eta, m
    {[10 100];  0;      [-5 5]}, ...    2D T, m
    {[10 100];  [0 3];  [-5 5]}, ...    3D T, eta, m
    };

Ns = [ ...
    100, ...
    100, ...
    100, ...
    400, ...
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