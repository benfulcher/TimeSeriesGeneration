function TSconfigs = generateMackeyGlassConfigs()
% parameter values to generate the TSconfig for
aVar =  [0.15,  1.5];    aFix =  0.2; 
bVar =  [];  bFix =  0.1;
tauVar =[10:40];  tauFix =17;

paramsCell = { ...
%     {aVar; bFix; tauFix}, ... 1D a
%     {aFix; bVar; tauFix}, ... 1D b
    {aFix; bFix; tauVar}, ... 1D tau
%     {aVar; bVar; tauFix}, ... 2D a, b
    {aVar; bFix; tauVar}, ... 2D a, tau
%     {aFix; bVar; tauVar}, ... 2D b, tau
%     {aVar; bVar; tauVar}, ... 3D a, b, tau
    };

Ns = [ ...
%     100, ...
    100, ...
    400, ...
    ];

TSconfigs = {};
for paramsInd = 1:length(paramsCell)
    TSconfigs = horzcat(TSconfigs, generateMackeyGlassConfig(paramsCell{paramsInd}, Ns(paramsInd)));
end

end


function config = generateMackeyGlassConfig(params, N)

    config.functionName = 'mackeyglass';
    config.signalNames = {'x'};

    config.nRealizations = N;

    config.paramNames = {'a', 'b', 'tau'};
    config.params = params;

    config.timeParamNames = {'n', 'dt'};
    config.timeParams = [...
        1200000; ...   signal steps
        0.01; ...   dt
        ];
    
    config.postprocessing = {...
        @(timeSeriesData, labels, keywords)...
        PP_removeTransients(timeSeriesData, labels, keywords, 200000), ...
        @(timeSeriesData, labels, keywords)...
        PP_downsample(timeSeriesData, labels, keywords, 150)};

end