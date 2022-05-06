# This file is a part of AHMI.jl, licensed under the MIT License (MIT).

"""
    AHMI

The Adaptive Harmonic Mean Integration (AHMI) algorithm.
"""
module AHMI

using LinearAlgebra
using Random
using Statistics
using Base.Threads

using StatsBase: FrequencyWeights, AnalyticWeights, Histogram, fit, weights
using ArraysOfArrays: flatview, nestedview
using ValueShapes: unshaped
using ParallelProcessingTools: @onthreads, @critical, allthreads, workpart
using Measurements: measurement
using QuadGK: quadgk
using ProgressMeter: Progress, @showprogress, next!, finish!

using Parameters: @with_kw
using DocStringExtensions

using RecipesBase: @recipe, @series

import BAT
using BAT: SpatialVolume, HyperRectVolume
using BAT: MCMCIterator, DensitySampleVector, MCMCBasicStats
using BAT: WhiteningAlgorithm, NoWhitening, CholeskyWhitening, CholeskyPartialWhitening, StatisticalWhitening
using BAT: IntegrationAlgorithm, AutocorLenAlgorithm, GeyerAutocorLen
using BAT: AnySampleable, SampledDensity

const _PLOTS_MODULE = Ref{Union{Module,Nothing}}(nothing)
_plots_module() = _PLOTS_MODULE[]

include("ahmi/ahmi.jl")
include("ahmi_integration.jl")
include("ahmi_plots.jl")

using Requires: @require
function __init__()
    @require Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80" _PLOTS_MODULE[] = Plots
end

end # module
