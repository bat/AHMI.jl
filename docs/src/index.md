# AHMI.jl

This package implements the [Adaptive Harmonic Mean Algorithm (AHMI)](http://doi.org/10.1142/S0217751X20501420).

The AHMI.jl is built to support the [BAT.jl](https://github.com/bat/BAT.jl) integration interface, to use AHMI, run

```julia
using AHMI, BAT

bat_integrate(target, AHMIntegration())
```

## Installation

AHMI.jl it not a registered Julia package yet and currently requires BAT.jl v3.0.0-DEV.

To install AHMI, use

```julia
julia> using Pkg
julia> pkg"add BAT#main"
julia> pkg"add https://github.com/bat/AHMI.jl.git"
```


## Citing AHMI

If you use AHMI as an important part of your work, please cite 
*Caldwell et al. "Integration with an Adaptive Harmonic Mean Algorithm", [IJMPA (2020)](http://doi.org/10.1142/S0217751X20501420).*

```
@article{Caldwell:2020AHMI,
  author    = {Caldwell, Allen and Eller, Philipp and Hafych, Vasyl and Schick, Rafael and Schulz, Oliver and Szalay, Marco},
  journal   = {International Journal of Modern Physics A},
  title     = {Integration with an adaptive harmonic mean algorithm},
  year      = {2020},
  number    = {24},
  pages     = {2050142},
  volume    = {35},
  doi       = {10.1142/S0217751X20501420},
  publisher = {World Scientific},
}
```
