function output = bimodal(delta, alpha, n)

    output = zeros(1, n);

    currentDist = 0; % 0 or 1
    for i = 1:n
        
        if currentDist == 1
            output(i) = randn;
        else
            output(i) = randn + delta;
        end
        
        % switch with p=alpha
        if rand > alpha
            currentDist = mod(currentDist+1,2);
        end
    end

end