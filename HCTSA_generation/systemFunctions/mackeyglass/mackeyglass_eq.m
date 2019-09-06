%% makeyglass_eq
% This function returns dx/dt of Mackey-Glass delayed differential equation

%%
% 
% $$\frac{dx(t)}{dt}=\frac{ax(t-\tau)}{1+x(t-\tau)^{10}}-bx(t)$$
% 

%%
% *Matlab code:*
function x_dot = mackeyglass_eq(x_t, x_t_minus_tau, a, b)
    x_dot = -b*x_t + a*x_t_minus_tau/(1 + x_t_minus_tau^10.0);
end


%%
%
% <mackeyglass.html _back to main_>
