function TSconfigs = generatePopulationGrowthConfigs()
% parameter values to generate the TSconfig for
rVar =      [0.1, 3];        rFix = 0.5;
KVar =      [0.5, 5];        KFix = 1;
betaVar =   [0.1, 10];    betaFix = 1;

paramsCell = { ...
    {rVar; KFix; betaFix}, ...       1D r
    {rFix; KVar; betaFix}, ...       1D K
    {rFix; KFix; betaVar}, ...       1D beta
    {rVar; KVar; betaFix}, ...       2D r, K
    {rVar; KFix; betaVar}, ...       2D r, beta
    {rFix; KVar; betaVar}, ...       2D K, beta
    {rVar; KVar; betaVar}, ...       3D r, K, beta
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
    TSconfigs = horzcat(TSconfigs, generateBimodalConfig(paramsCell{paramsInd}, Ns(paramsInd)));
end

end

function config = generateBimodalConfig(params, N)

    config.functionName = 'populationGrowth';
    config.signalNames = {'x'};

    config.nRealizations = N;

    config.paramNames = {'r', 'K', 'beta'};
    config.params = params;

    config.timeParamNames = {'steps'};
    config.timeParams = [...
        3000; ...   signal steps
        ];

end