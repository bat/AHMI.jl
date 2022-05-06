# This file is a part of AHMI.jl, licensed under the MIT License (MIT).

using Test
using AHMI
import Documenter

Documenter.DocMeta.setdocmeta!(
    AHMI,
    :DocTestSetup,
    :(using AHMI);
    recursive=true,
)
Documenter.doctest(AHMI)
