function output = stochasticSineMap(mu, q, b, n)

    output = MkSg_map('FreitasStochasticSine', n, [], [mu, b, q]);

%     output = zeros(1,n);
%     output(1) = unifrnd(-1,1);
%     
%     for i = 1:(n-1)
%        output(i+1) = mu * sin(output(i)) + binornd(1,q) * unifrnd(-b, b); 
%     end

end