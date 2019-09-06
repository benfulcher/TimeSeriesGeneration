function TSconfigs = generateLorenzConfigs2()
% parameter values to generate the TSconfig for
sigmaVar =  [8, 30];    sigmaFix =  10; 
rVar =      [35, 60];  rFix =      35;
bVar =      [1, 2.8];  bFix =      8/3;

paramsCell = { ...
    {sigmaVar; rFix; bFix}, ... 1D sigma
    {sigmaFix; rVar; bFix}, ... 1D r
    {sigmaFix; rFix; bVar}, ... 1D b
    {sigmaVar; rVar; bFix}, ... 2D sigma, r
    {sigmaVar; rFix; bVar}, ... 2D sigma, b
    {sigmaFix; rVar; bVar}, ... 2D r, b
    {sigmaVar; rVar; bVar}, ... 3D sigma, r, b
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
    TSconfigs = horzcat(TSconfigs, generateLorenzConfig(paramsCell{paramsInd}, Ns(paramsInd)));
end

end

function config = generateLorenzConfig(params, N)

    config.functionName = 'lorenzAtt';
    config.signalNames = {'x', 'y', 'z'};

    config.nRealizations = N;

    config.paramNames = {'s', 'r', 'b'};
    config.params = params;

    config.timeParamNames = {'timeSteps'};
    config.timeParams = [...
        5000; ...   signal steps
        ];
    
end