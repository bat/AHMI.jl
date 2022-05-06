# Internal API

!!! note

    This is the documentation of AHMI's internal API, it is subject to change without deprecation.

## Types

```@index
Pages = ["internal_api.md"]
Order = [:type]
```

## Functions and macros

```@index
Pages = ["internal_api.md"]
Order = [:macro, :function]
```

# Documentation

```@docs
AHMI.DataSet
AHMI.HMIData
AHMI.HMISettings
AHMI.IntegrationVolume
AHMI.PointCloud
AHMI.SearchResult
AHMI.WhiteningResult

AHMI.create_hypercube
AHMI.create_hyperrectangle
AHMI.find_hypercube_centers
AHMI.hm_init
AHMI.hm_integrate!
AHMI.hm_whiteningtransformation!
AHMI.hyperrectangle_creationproccess!
AHMI.integrate_hyperrectangle_cov
AHMI.modify_hypercube!
AHMI.modify_integrationvolume!
AHMI.reduced_volume_hm
```
