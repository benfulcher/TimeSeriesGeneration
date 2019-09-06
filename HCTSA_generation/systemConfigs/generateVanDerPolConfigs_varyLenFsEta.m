function TSconfigs = generateVanDerPolConfigs_varyLenFsEta(tsLen, Fs, eta)
% parameter values to generate the TSconfig for
kVar =  [0.1, 5];  kFix =  1;
cVar =  [0.1, 5];  cFix =  1;

paramsCell = { ...
%     {cVar, kFix}, ... 1D c
%     {cFix, kVar}, ... 1D k
    {cVar, kVar}, ... 2D c, k
    };

Ns = [ ...
%     100, ...
%     100, ...
    400, ...
    ];

TSconfigs = {};
for paramsInd = 1:length(paramsCell)
    TSconfigs = horzcat(TSconfigs, generateVanDerPolConfig(paramsCell{paramsInd}, Ns(paramsInd), tsLen, Fs, eta));
end

end

function config = generateVanDerPolConfig(params, N, tsLen, Fs, eta)

    config.functionName = 'vanDerPol_L';
    config.signalNames = {'x', 'y'};

    config.nRealizations = N;

    config.paramNames = {'c', 'k'};
    config.params = params;

    config.timeParamNames = {'timeSteps', 'L'};
    config.timeParams = [...
        tsLen; ...   signal steps
        tsLen/Fs; ... time (s) covered
        ];
    
    config.postprocessing = {...
        @(timeSeriesData, labels, keywords)...
        PP_addNoise(timeSeriesData, labels, keywords, eta)};
    
end