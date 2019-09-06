function [timeSeriesData, labels, keywords] = PP_downsample(timeSeriesData, labels, keywords, factor)
% mock function for lyapunov exponent calculation. Replace with actual
% lyapunov exponent calculation

    n = length(timeSeriesData);
    
    if round(factor) ~= factor
        error('Downsampling factor needs to be integer.');
    end
    
    for i = 1:n
       timeSeriesData{i} = timeSeriesData{i}(1:factor:end);
       keywords{i} = [keywords{i}, ',downsamplingFactor', num2str(factor)];
    end

end