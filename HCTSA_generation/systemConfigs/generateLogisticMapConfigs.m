function TSconfigs = generateLogisticMapConfigs()
% parameter values to generate the TSconfig for
% A      [3.5 4]
% x0     0.1

paramsCell = { ...
    {[3.5 4];    0.1}, ...           1D A
    };

Ns = [ ...
    100, ...
    ];

TSconfigs = {};
for paramsInd = 1:length(paramsCell)
    TSconfigs = horzcat(TSconfigs, generateLogisticMapConfig(paramsCell{paramsInd}, Ns(paramsInd)));
end

end

function config = generateLogisticMapConfig(params, N)

    config.functionName = 'logisticMap';
    config.signalNames = {'x'};

    config.nRealizations = N;

    config.paramNames = {'A','x0'};
    config.params = params;

    config.timeParamNames = {'timeSteps'};
    config.timeParams = [...
        2000; ...   signal steps
        ];
    
%     config.postprocessing = {...
%         @(timeSeriesData, labels, keywords) ...
%         PP_removeTransients(timeSeriesData, labels, keywords, 500)}; %, ...
%         @(timeSeriesData, labels, keywords) ...
%         PP_LyapunovExponent(timeSeriesData, labels, keywords)};

end