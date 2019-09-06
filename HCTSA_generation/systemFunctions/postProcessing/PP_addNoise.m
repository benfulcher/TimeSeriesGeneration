function [timeSeriesData, labels, keywords, folderNameAdd] = PP_addNoise(timeSeriesData, labels, keywords, noiseAmp)
% mock function for lyapunov exponent calculation. Replace with actual
% lyapunov exponent calculation

    for i = 1:length(timeSeriesData)
       timeSeriesData{i} = timeSeriesData{i} + rand(size(timeSeriesData{i}))*noiseAmp;
       keywords{i} = [keywords{i}, ',addedNoiseAmplitude=', num2str(noiseAmp)];
    end
    folderNameAdd = sprintf('_addEta=%1.4f', noiseAmp);

end