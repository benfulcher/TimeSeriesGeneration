function [timeSeriesData, labels, keywords] = PP_LyapunovExponent(timeSeriesData, labels, keywords)
% mock function for lyapunov exponent calculation. Replace with actual
% lyapunov exponent calculation

    n = length(timeSeriesData);
    
    for i = 1:n
       timeSeries = timeSeriesData{i};
       lyapunovExp = lyapspec(timeSeries, 1, 5, 12, 0.05, 10);%1; % change this.
       keywords{i} = [keywords{i}, ',LE=', num2str(lyapunovExp)];
    end

end