using AHMI
using Test

using Distributions
using ValueShapes
using IntervalSets
using LinearAlgebra: Diagonal, ones

import BAT
using BAT: bat_sample, bat_integrate, bat_eff_sample_size
using BAT: IntegrationAlgorithm, IIDSampling
using BAT: MCMCSampling, MetropolisHastings, DoNotTransform, MCMCMultiCycleBurnin
using BATTestCases

@testset "ahmi_integration" begin
    function test_integration(algorithm::IntegrationAlgorithm, title::String,
                              dist::Distribution; val_expected::Real=1.0,
                              val_rtol::Real=3.5, err_max::Real=0.2)
        @testset "$title" begin
            samplingalg = MCMCSampling(
                mcalg = MetropolisHastings(),
                trafo = DoNotTransform(),
                nsteps = 2*10^5,
                burnin = MCMCMultiCycleBurnin(nsteps_per_cycle = 10^5, max_ncycles = 60)
            )
            sample = bat_sample(dist, samplingalg).result
            sample_integral = bat_integrate(sample, algorithm).result

            @test isapprox(sample_integral.val, val_expected, atol=val_rtol*sample_integral.err)
            @test sample_integral.err < err_max
        end
    end
    test_integration(AHMIntegration(), "funnel distribution", FunnelDistribution(), val_rtol = 15)
    test_integration(AHMIntegration(), "multimodal student-t distribution", MultimodalStudentT(), val_rtol = 50)
    # TODO - Fix: test_integration(AHMIntegration(), "Gaussian shell", GaussianShell(), val_rtol = 15)
    test_integration(AHMIntegration(), "MvNormal", MvNormal(Diagonal(ones(5))), val_rtol = 15)

    @testset "ahmi_integration_defaults" begin
        bsample = @inferred(bat_sample(product_distribution([Normal() for i in 1:3]), IIDSampling(nsamples = 10^4))).result
        @test isapprox(bat_integrate(bsample, AHMIntegration()).result.val, 1.0, rtol=15)
        eff_sample_size_dsv = @inferred(bat_eff_sample_size(bsample)).result
        eff_sample_size_aosa = @inferred(bat_eff_sample_size(bsample.v)).result
        for i in eachindex(@inferred(bat_eff_sample_size(bsample)).result)
            @test 8000 <= eff_sample_size_dsv[i] <= 10^4
            @test eff_sample_size_dsv[i] == eff_sample_size_aosa[i]
        end
    end
end
