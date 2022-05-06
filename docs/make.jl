# Use
#
#     DOCUMENTER_DEBUG=true julia --color=yes make.jl local [nonstrict] [fixdoctests]
#
# for local builds.

using Documenter
using AHMI

# Doctest setup
DocMeta.setdocmeta!(
    AHMI,
    :DocTestSetup,
    :(using AHMI);
    recursive=true,
)

makedocs(
    sitename = "AHMI",
    modules = [AHMI],
    format = Documenter.HTML(
        prettyurls = !("local" in ARGS),
        canonical = "https://bat.github.io/AHMI.jl/stable/"
    ),
    pages = [
        "Home" => "index.md",
        "API Documentation" => "stable_api.md",
        "Internal API" => "internal_api.md",
        "LICENSE" => "LICENSE.md",
    ],
    doctest = ("fixdoctests" in ARGS) ? :fix : true,
    linkcheck = !("nonstrict" in ARGS),
    strict = !("nonstrict" in ARGS),
)

deploydocs(
    repo = "github.com/bat/AHMI.jl.git",
    forcepush = true,
    push_preview = true,
)
