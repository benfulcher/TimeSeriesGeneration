function s = vanDerPol_L(c, k, N, L)

params = [c, k];
s = MkSg_Flow('vdp', N, L, [], params);