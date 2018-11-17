function output = noisySineWithMeanShift(T, eta, s, n)
    
    t = 1:n;
    
    output = sin(2*pi*t/T) + eta * randn(1,n) + s;
    
end