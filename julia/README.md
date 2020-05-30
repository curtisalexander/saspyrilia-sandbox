# Setup

Setting up an environment for Julia requires working with [pkg](https://julialang.github.io/Pkg.jl/v1/).

No other setup is required after installing as `pkg` is part of the standard library.

## `activate` environment

From the Julia REPL enter into the `pkg` REPL using `]`.  Your prompt will change to `pkg>`.

Then `cd` into the appropriate directory and activate the environment.

```
pkg> activate .
```

Exiting requires a `Ctrl+C`.

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

