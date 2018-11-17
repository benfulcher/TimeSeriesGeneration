function signal = lorenzAtt(s, r, b, n)

    signal = MkSg_Flow('Lorenz', n, round(0.01*n), [], [s,r,b]);

%     signalX = zeros(1,n);
%     signalY = zeros(1,n);
%     signalZ = zeros(1,n);
%     
%     signalX(1) = x0;
%     signalY(1) = y0;
%     signalZ(1) = z0;
% 
%     for i = 1:(n-1)
%         
%         [xDot, yDot, zDot] = lorenz_1step(signalX(i), signalY(i), signalZ(i), s, r, b);
%         signalX(i+1) = signalX(i) + xDot * dt;
%         signalY(i+1) = signalY(i) + yDot * dt;
%         signalZ(i+1) = signalZ(i) + zDot * dt;
%         
%     end
% 
%     signals = [signalX; signalY; signalZ];
%     
% end
% 
% function [xDot, yDot, zDot] = lorenz_1step(x, y, z, s, r, b) %, s=10, r=28, b=2.667
%     
%     xDot = s*(y - x);
%     yDot = r*x - y - x*z;
%     zDot = x*y - b*z;
%     
% end
