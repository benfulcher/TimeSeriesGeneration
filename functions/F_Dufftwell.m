function dy = F_Dufftwell(t,y)
% A Duffing oscillator with k1=-1,k2=1,A=0
global b
% b=2;

dy(1) = y(2);
dy(2) = -b*y(2)+y(1)-y(1)^3;

dy = dy';

end
