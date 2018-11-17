function TSconfigs = generateBimodalConfigs()
% parameter values to generate the TSconfig for
% delta [0 6] or 3
% alpha [0 1] or 0.5

paramsCell = { ...
    {[0 6]; 0.5}, ...       1D delta
    {3;     [0 1]}, ...     1D alpha
    {[0 6]; [0 1]}, ...     2D delta, alpha
    };

Ns = [ ...
    100, ...
    100, ...
    400, ...
    ];

TSconfigs = {};
for paramsInd = 1:length(paramsCell)
    TSconfigs = horzcat(TSconfigs, generateBimodalConfig(paramsCell{paramsInd}, Ns(paramsInd)));
end

end

function config = generateBimodalConfig(params, N)

    config.functionName = 'bimodal';
    config.signalNames = {'x'};

    config.nRealizations = N;

    config.paramNames = {'delta', 'alpha'};
    config.params = params;

    config.timeParamNames = {'steps'};
    config.timeParams = [...
        1000; ...   signal steps
        ];

end