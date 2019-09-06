function [timeSeriesData, labels, keywords] = PP_removeTransients(timeSeriesData, labels, keywords, eta)
% mock function for lyapunov exponent calculation. Replace with actual
% lyapunov exponent calculation

    n = length(timeSeriesData);
    
    for i = 1:n
       timeSeriesData{i} = timeSeriesData{i}((eta+1):end);
       keywords{i} = [keywords{i}, ',startRemoved', num2str(eta)];
    end

end