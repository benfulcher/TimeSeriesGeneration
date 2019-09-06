function TSconfigs = generateStochasticSineMapConfigs2()
% parameter values to generate the TSconfig for
muVar = [2.5 4];    muFix = 2.5;
qVar =  [0 1];      qFix = 0.5;
bVar =  [0 3];      bFix = 1;

paramsCell = { ...
    {muVar; qFix; bFix}, ... 1D mu
    {muFix; qVar; bFix}, ... 1D q
    {muFix; qFix; bVar}, ... 1D b
    {muVar; qVar; bFix}, ... 2D mu, q
    {muVar; qFix; bVar}, ... 2D mu, b
    {muFix; qVar; bVar}, ... 2D b, q
    {muVar; qVar; bVar}, ... 3D mu, b, q
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
    TSconfigs = horzcat(TSconfigs, generateStochasticSineMapConfig(paramsCell{paramsInd}, Ns(paramsInd)));
end

end

function config = generateStochasticSineMapConfig(params, N)

    config.functionName = 'stochasticSineMap';
    config.signalNames = {'x'};

    config.nRealizations = N;

    config.paramNames = {'mu', 'q', 'b'};
    config.params = params;

    config.timeParamNames = {'steps'};
    config.timeParams = [...
        2500; ...   signal steps
        ];
    
%     config.postprocessing = ...
%         {@(timeSeriesData, labels, keywords) ...
%         PP_removeTransients(timeSeriesData, labels, keywords, 500)};

end