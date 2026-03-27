# ggsegDestrieux

<!-- badges: start -->
[![R-CMD-check](https://github.com/ggsegverse/ggsegDestrieux/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ggsegverse/ggsegDestrieux/actions/workflows/R-CMD-check.yaml)
[![r-universe](https://ggsegverse.r-universe.dev/badges/ggsegDestrieux)](https://ggsegverse.r-universe.dev/ggsegDestrieux)
<!-- badges: end -->

Destrieux Atlas for the ggsegverse Ecosystem.

## Installation

``` r
# From r-universe
install.packages("ggsegDestrieux", repos = "https://ggsegverse.r-universe.dev")

# From GitHub
# install.packages("remotes")
remotes::install_github("ggsegverse/ggsegDestrieux")
```

## Usage

``` r
library(ggsegDestrieux)
library(ggseg)

plot(destrieux()) +
  theme_brain()
```

## Atlas

### destrieux

Destrieux cortical parcellation (aparc.a2009s) with 75 regions per hemisphere (Destrieux et al., 2010).

![destrieux](man/figures/destrieux_snapshot.png)
