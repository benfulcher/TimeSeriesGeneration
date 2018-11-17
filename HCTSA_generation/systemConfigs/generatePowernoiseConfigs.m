function configs = generatePowernoiseConfigs()
    configs = {generatePowernoiseConfig()};
end

function config = generatePowernoiseConfig()

    config.functionName = 'F_powernoise';
    config.signalNames = {'x'};

    config.nRealizations = 200;

    config.paramNames = {'alpha'};
    config.params = {...
        [-1,    3]; ...     alpha
        };

    config.timeParamNames = {'steps'};
    config.timeParams = [...
        3500; ...   signal steps
        ];
end