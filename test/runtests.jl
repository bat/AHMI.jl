# This file is a part of AHMI.jl, licensed under the MIT License (MIT).

import Test

import Logging
import TerminalLoggers
Logging.global_logger(TerminalLoggers.TerminalLogger(stderr, Logging.Error))

Test.@testset "Package AHMI" begin
    include("test_ahmi_integration.jl")
    include("test_docs.jl")
end # testset
