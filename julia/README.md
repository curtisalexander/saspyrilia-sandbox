# Setup

Setting up an environment for Julia requires working with [pkg](https://julialang.github.io/Pkg.jl/v1/).

No other setup is required after installing as `pkg` is part of the standard library.

## `activate` environment

From the Julia REPL enter into the `pkg` REPL using `]`.  Your prompt will change to `pkg>`.

Then `cd` into the appropriate directory and activate the environment.

```
pkg> activate .
```

Exiting requires `Ctrl+C`.

## Add packages

Packages are added via the `pkg` REPL.

```
pkg> add Queryverse
```

## Precompile project

```
pkg> update; precompile
```

## Cleanup

```
pkg> gc
```

## Artifacts

Although I have not used the functionality, it looks to be quite interesting.

https://julialang.github.io/Pkg.jl/v1.4/artifacts/

## [Revise.jl](https://timholy.github.io/Revise.jl/stable/) Workflow

### Init
Initial setup requires adding `Revise.jl`.

```
pkg> add Revise
```

Then setup `Revise` to launch at startup.  Edit `.julia/config/startup.jl` to use `Revise`.

```julia
try
    using Revise
catch e
    @warn(e.msg)
end
```

### Workflow
Within the REPL, ensure that the current environment is activated.

```julia
using Pkg
Pkg.activate(".")
```

Next, load the script file

```julia
includet("gettingstarted/rowwiseinit.jl")
```

All development happens in the actual `*.jl` file.  It is then re-imported (via `Revise.jl` and exploration within the REPL continues.
