function TSconfigs = generateRosslerConfigs()
% parameter values to generate the TSconfig for
aVar =  [0.1, 0.3]; aFix =  0.2; 
bVar =  [0.01, 2];  bFix =  0.2;
cVar =  [4.5, 20];  cFix =  5.7;

paramsCell = { ...
    {aVar; bFix; cFix}, ... 1D a
    {aFix; bVar; cFix}, ... 1D b
    {aFix; bFix; cVar}, ... 1D c
    {aVar; bVar; cFix}, ... 2D a, b
    {aVar; bFix; cVar}, ... 2D a, c
    {aFix; bVar; cVar}, ... 2D b, c
    {aVar; bVar; cVar}, ... 3D a, b, c
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
    TSconfigs = horzcat(TSconfigs, generateRosslerConfig(paramsCell{paramsInd}, Ns(paramsInd)));
end

end

function config = generateRosslerConfig(params, N)

    config.functionName = 'rossler';
    config.signalNames = {'x', 'y', 'z'};

    config.nRealizations = N;

    config.paramNames = {'a', 'b', 'c'};
    config.params = params;

    config.timeParamNames = {'timeSteps'};
    config.timeParams = [...
        2000; ...   signal steps
        ];
    
end