# TimeSeriesGeneration
Matlab code for generating time series different types of dynamical systems.

Basic support for:
* Autoregressive processes: `MkSg_AR`
* Systems of ODEs (dynamical systems, or flows, including all systems included in *Chaos and Time-Series Analysis* by J. C. Sprott): `MkSg_Flow`
* Iterative maps (including all of those listed in *Chaos and Time-Series Analysis* by J. C. Sprott): `MkSg_Map`
* Uncorrelated random noise (from a given distribution): `MkSg_Noise`
* Self-affine processes: `MkSg_SelfAffine`
* Noisy sinusoids: `MkSg_Sine`

## Generation of HCTSA files for different systems with continuously varying parameters

`runScript.m`
