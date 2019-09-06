function signal = logisticMap (A, x0, n)

    signal = MkSg_map('logistic', n, x0, A, 500);

%     signal = zeros(1,n);
%     
%     signal(1) = x0;
%     
%     for i = 1:(n-1)
%        signal(i+1) = A * signal(i) * (1 - signal(i));
%     end
    
end