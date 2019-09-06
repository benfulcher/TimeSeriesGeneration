function TSconfigs = generateVanDerPolConfigs()
% parameter values to generate the TSconfig for
kVar =  [0.1, 5];  kFix =  1;
cVar =  [0.1, 5];  cFix =  1;

paramsCell = { ...
    {cVar, kFix}, ... 1D c
    {cFix, kVar}, ... 1D k
    {cVar, kVar}, ... 2D c, k
    };

Ns = [ ...
    100, ...
    100, ...
    400, ...
    ];

TSconfigs = {};
for paramsInd = 1:length(paramsCell)
    TSconfigs = horzcat(TSconfigs, generateVanDerPolConfig(paramsCell{paramsInd}, Ns(paramsInd)));
end

end

function config = generateVanDerPolConfig(params, N)

    config.functionName = 'vanDerPol';
    config.signalNames = {'x', 'y'};

    config.nRealizations = N;

    config.paramNames = {'c', 'k'};
    config.params = params;

    config.timeParamNames = {'timeSteps'};
    config.timeParams = [...
        500; ...   signal steps
        ];
    
end