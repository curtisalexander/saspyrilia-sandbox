# Setup

The general workflow utilizes [Revise.jl](https://timholy.github.io/Revise.jl/stable/).  This workflow is outlined in two key places:
- [Revise documentation](https://timholy.github.io/Revise.jl/stable/cookbook/)
- [Julia documentation](https://docs.julialang.org/en/v1/manual/workflow-tips/#Revise-based-workflows-1)

## Setup `PkgTemplates`

Using the [Package-centric workflow](https://timholy.github.io/Revise.jl/stable/cookbook/#Package-centric-usage-1) notes the need to setup [PkgTemplates](https://invenia.github.io/PkgTemplates.jl/stable/).

First, ensure `PkgTemplates` has been added as a package.

From the Julia REPL enter into the `pkg` REPL using `]`.  Your prompt will change to `pkg>`.

```
pkg> add PkgTemplates
pkg> update; precompile
```

Exiting requires `Ctrl+C` or using `Backspace`.

## Setup development package with `PkgTemplates`
Now follow the [Revise documentation](https://timholy.github.io/Revise.jl/stable/cookbook/) for utilizing `PkgTemplates`.

```
using PkgTemplates
t = Template()
t("MyPkg")  # in lieu of generate("MyPkg", t)
```

Note that for this work, I had to add the following to my `.gitconfig` file.

```
[github]
    user = myusername
```

Thus my new development package is now stored at `~/.julia/dev/MyPkg`.  The `Manifest.toml` and `Project.toml` files are contained within.

## `activate` package
Within the REPL, ensure that the current package/environment is activated.

```julia
using Pkg
Pkg.activate("MyPkg")
```

To check that you are in the correct environment, utilize `status`.
```
pkg> status
```

## `add` packages
Add `Revise.jl` and any other packages desired.

From the Julia REPL enter into the `pkg` REPL using `]`.  Your prompt will change to `pkg>`.

```
pkg> add Revise
pkg> add DataFrames
pkg> update; precompile
```

Exiting requires `Ctrl+C` or using `Backspace`.

## Setup `Revise.jl`

Setup `Revise` to launch at startup.  Edit `.julia/config/startup.jl` to use `Revise`.  Note that at the time of writing I am using Julia `1.4.x`.

```julia
# Julia 1.5+ and Revise 2.6+
# try
#     using Revise
# catch e
#     @warn(e.msg)
# end

# Earlier versions of Revise and/or Julia
atreplinit() do repl
    try
        @eval using Revise
        @async Revise.wait_steal_repl_backend()
    catch e
        @warn(e.msg)
    end
end
```

## Edit Source Files

Finally, you are ready to edit source files!  Again, referencing the [Revise documentation](https://timholy.github.io/Revise.jl/stable/cookbook/), enter the below to use the package and note where source files are stored.

```
using MyPkg
pathof(MyPkg)
```



### asdf
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

Then setup `Revise` to launch at startup.  Edit `.julia/config/startup.jl` to use `Revise`.  Note that at the time of writing I am using Julia `1.4.x`.

```julia
# Julia 1.5+ and Revise 2.6+
# try
#     using Revise
# catch e
#     @warn(e.msg)
# end

# Earlier versions of Revise and/or Julia
atreplinit() do repl
    try
        @eval using Revise
        @async Revise.wait_steal_repl_backend()
    catch e
        @warn(e.msg)
    end
end
```

### Workflow
Next, setup the project


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
