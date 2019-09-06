function s = rossler(a, b, c, N)

s0 = [-9; 0; 0];

params = [a, b, c];
s = MkSg_Flow('Rossler', N, [], s0, params);