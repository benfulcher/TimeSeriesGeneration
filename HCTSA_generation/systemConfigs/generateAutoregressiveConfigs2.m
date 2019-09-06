function TSconfigs = generateAutoregressiveConfigs2()
% parameter values to generate the TSconfig for
% tau       [1:10] or 2
% alpha     [0.8, 0.999] or 0.9

paramsCell = { ...
    {[2:10];    0.9}, ...           1D tau
    {2;         [0.8, 0.999]}, ...  1D alpha
    {[2:10];    [0.8, 0.999]}, ...  2D tau, alpha
    };

Ns = [ ...
    100, ...
    100, ...
    400, ...
    ];

TSconfigs = {};
for paramsInd = 1:length(paramsCell)
    TSconfigs = horzcat(TSconfigs, generateAutoregressiveConfig(paramsCell{paramsInd}, Ns(paramsInd)));
end

end

function config = generateAutoregressiveConfig(params, N)

    config.functionName = 'autoregressive';
    config.signalNames = {'x'};

    config.nRealizations = N;

    config.paramNames = {'tau', 'alpha'};
    config.params = params;

    config.timeParamNames = {'steps'};
    config.timeParams = [...
        3500; ...   signal steps
        ];
    
%     config.postprocessing = ...
%         {@(timeSeriesData, labels, keywords) ...
%         PP_removeTransients(timeSeriesData, labels, keywords, 500)};

end