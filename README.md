
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggsegDestrieux <img src='man/figures/logo.png' align="right" height="138.5" />

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/250272332.svg)](https://zenodo.org/badge/latestdoi/250272332)
[![R-CMD-check](https://github.com/ggsegverse/ggsegDestrieux/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ggsegverse/ggsegDestrieux/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

This package contains dataset for plotting the Destrieux cortical atlas
with ggseg and ggseg3d.

Destrieux, Fischl, Dale, & Halgren (2010) Neuroimage. 53(1): 1–15. doi:
[10.1016/j.neuroimage.2010.06.010](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2937159/)

To learn how to use these atlases, please look at the documentation for
[ggseg](https://ggsegverse.github.io/ggseg/) and
[ggseg3d](https://ggsegverse.github.io/ggseg3d).

## Installation

We recommend installing the ggseg-atlases through the ggsegverse
[r-universe](https://ggsegverse.r-universe.dev/ui#builds):

``` r
# Enable this universe
options(repos = c(
    ggsegverse = 'https://ggsegverse.r-universe.dev',
    CRAN = 'https://cloud.r-project.org'))

# Install some packages
install.packages('ggsegDestrieux')
```

You can install the released version version from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("ggsegverse/ggsegDestrieux")
```

``` r
library(ggseg)
library(ggsegDestrieux)
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

<img src="man/figures/README-unnamed-chunk-4-1.png" alt="" width="100%" />

``` r
library(ggseg3d)

ggseg3d(atlas = destrieux()) |>
  pan_camera("right lateral")
```

<img src="man/figures/README-3d-plot.png" alt="" width="100%" />

Please note that the ‘ggsegDestrieux’ project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to
this project, you agree to abide by its terms.
