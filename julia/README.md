# Setup

The general workflow utilizes [Revise.jl](https://timholy.github.io/Revise.jl/stable/).  This workflow is outlined in two key places:
- [Revise documentation](https://timholy.github.io/Revise.jl/stable/cookbook/)
- [Julia documentation](https://docs.julialang.org/en/v1/manual/workflow-tips/#Revise-based-workflows-1)


## Add [Revise.jl](https://timholy.github.io/Revise.jl/stable/)
Initial setup requires adding `Revise.jl`.  For ease, add to the global environment.

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


## Initial Package Setup
The below only is needed for creating the initial package.

### Generate Package
Per the instruction for a [throw away project](https://docs.julialang.org/en/v1/manual/workflow-tips/#Revise-based-workflows-1) generate a new package using `Pkg`.

First, `cd` into the appropriate directory.  Then startup a Julia REPL. From the Julia REPL enter into the `Pkg` REPL using `]`.  Your prompt will change to `pkg>`.

Now generate the actual package.

```
pkg> generate MyPkg
```

Exiting requires `Ctrl+C` or using `Backspace`.

### Use Package
Now use the actual package and test that it was setup appropriately.

```julia
using MyPkg
MyPkg.greet()
```

## Work with Dependencies
If need to add or remove packages, utilize the flow below.

### `activate` Package
`cd` into the package directory (the directory containing the `Project.toml` file).

Start a Julia REPL and then `activate` the package.

```julia
using Pkg
Pkg.activate(".")
```

### Add / Remove packages
Now drop into the `Pkg` REPL using `]` and add or remove any packages needed.

```
pkg> add DataFrames
pkg> update; precompile
```


## Workflow
The below is a general workflow assuming no further packages need to be added.

### `activate` package

Start a Julia REPL and then `activate` the package.

```julia
using Pkg
Pkg.activate("MyPkg")
```

### Edit Source Code
Finally, you are ready to edit source files!  `cd` into the new package directory.

```bash
cd /some/path/MyPkg
```

Edit the file `src/MyPkg.jl`.  This file is being tracked by `Revise` and thus it can serve as a file runner where it points to other source files.

For example, within the file `src/MyPkg.jl` reference another source file.

```julia
module MyPkg
include("Tmp.jl")

end
```

### Test Source Code
Again, referencing the [Revise cookbook](https://timholy.github.io/Revise.jl/stable/cookbook/), enter the below to use the package.

```julia
using MyPkg
```

Finally, utilize your REPL to validate the changes!

```julia
MyPkg.SomeOtherModule.func()
```

To force a refresh, use the following.

```julia
revise(MyPkg)
```

<!--## Setup `PkgTemplates`

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
-->

## Artifacts

Although I have not used the functionality, it looks to be quite interesting.

https://julialang.github.io/Pkg.jl/v1.4/artifacts/
