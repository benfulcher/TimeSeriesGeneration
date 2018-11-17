function output = noisySineWithLinearTrend(T, eta, m, n)
    
    t = 1:n;
    
    output = sin(2*pi*t/T) + eta * randn(1,n) + m * t / n;
    
end