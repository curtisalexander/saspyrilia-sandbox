# Setup

## Install `renv`

Install `renv` to your global set of packages.  This is the only new package installed to the global location.
```R
install.packages("renv")
```

To see where your libraries live on disk, run `.libPaths()` from within R.

## RStudio Project

Setup directory as an [RStudio Project](https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects).

## `renv` workflow

A simple outline to the `renv` workflow can be found within the library's [documentation](https://rstudio.github.io/renv/articles/renv.html).

In summary:
- Initalize via `renv::init()`
- Install packages using either `renv::install() or install.packages()`
- Snapshot packages via `renv::snapshot()`
- Rinse and repeat



