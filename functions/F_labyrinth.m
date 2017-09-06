function dx = F_labyrinth(t,x)
% Labyrinth Chaos

dx=zeros(3,1);

dx(1) = sin(x(2));
dx(2) = sin(x(3));
dx(3) = sin(x(1));

end
