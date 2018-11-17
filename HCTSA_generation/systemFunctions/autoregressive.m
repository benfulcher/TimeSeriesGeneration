function signal = autoregressive(tau, alpha, n)

    % make sure the process doesn't diverge by limiting the sum of 
    % coeffs to alpha
    params = repmat(alpha/tau, tau, 1);
	signal = MkSg_AR(n,params,500);

%     signal = zeros(1,n);
%     
%     if tau == 1 
%         signal(1) = 0.1;
%     else
%         signal(1:tau) = randn(1,tau);
%     end
%     
%     for i = (tau+1):(n-1)
%         signal(i) = alpha * signal(i-tau) + randn;
%     end

end

