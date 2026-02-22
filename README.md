

<!-- README.md is generated from README.qmd. Please edit that file -->

# ggsegDestrieux <img src='man/figures/logo.png' align="right" height="138.5" />

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/250272332.svg)](https://zenodo.org/badge/latestdoi/250272332)
[![Codecov test
coverage](https://codecov.io/gh/ggsegverse/ggsegDestrieux/branch/master/graph/badge.svg)](https://codecov.io/gh/ggsegverse/ggsegDestrieux?branch=master)
[![R build
status](https://github.com/ggsegverse/ggsegDestrieux/workflows/R-CMD-check/badge.svg)](https://github.com/ggsegverse/ggsegDestrieux/actions)
<!-- badges: end -->

This package contains dataset for plotting the Destrieux cortical atlas
for ggseg.

Destrieux, Fischl, Dale, & Halgren (2010) Neuroimage. 53(1): 1-15. doi:
[10.1016/j.neuroimage.2010.06.010](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2937159/)

## Installation

We recommend installing the ggseg-atlases through the ggseg
[r-universe](https://ggseg.r-universe.dev/ui#builds):

``` r
options(repos = c(
  ggseg = "https://ggseg.r-universe.dev",
  CRAN = "https://cloud.r-project.org"
))

install.packages("ggsegDestrieux")
```

You can install from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("ggsegverse/ggsegDestrieux")
```

## Example

``` r
library(ggsegDestrieux)
library(ggseg)
library(ggplot2)

ggplot() +
  geom_brain(
    atlas = destrieux(),
    mapping = aes(fill = label),
    position = position_brain(hemi ~ view),
    show.legend = FALSE
  ) +
  scale_fill_manual(values = destrieux()$palette, na.value = "grey") +
  theme_void()
```

<img src="man/figures/README-2d-plot-1.png" style="width:100.0%" />

Please note that the ‘ggsegDestrieux’ project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to
this project, you agree to abide by its terms.
