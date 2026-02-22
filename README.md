
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggsegdestrieux <img src='man/figures/logo.png' align="right" height="138.5" />

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/250272332.svg)](https://zenodo.org/badge/latestdoi/250272332)
[![Codecov test
coverage](https://codecov.io/gh/LCBC-UiO/ggsegdestrieux/branch/master/graph/badge.svg)](https://codecov.io/gh/LCBC-UiO/ggsegdestrieux?branch=master)
[![R build
status](https://github.com/LCBC-UiO/ggsegdestrieux/workflows/R-CMD-check/badge.svg)](https://github.com/LCBC-UiO/ggsegdestrieux/actions)
<!-- badges: end -->

This package contains dataset for plotting the destrieux cortical atlas
ggseg and ggseg3d.

destrieux, Fischl, Dale,& Halgren (2010) Neuroimage. 53(1): 1–15. doi:
[0.1016/j.neuroimage.2010.06.010](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2937159/)

## Installation

We recommend installing the ggseg-atlases through the ggseg
[r-universe](https://ggsegverse.r-universe.dev/ui#builds):

``` r
# Enable this universe
options(repos = c(
    ggsegverse = 'https://ggsegverse.r-universe.dev',
    CRAN = 'https://cloud.r-project.org'))

# Install some packages
install.packages('ggsegdestrieux')
```

You can install the released version version from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("LCBC-UiO/ggsegdestrieux")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(ggsegdestrieux)
```

``` r
library(ggseg)
library(ggplot2)

plot(destrieux) +
  theme(legend.position = "bottom",
        legend.text = element_text(size = 7)) +
  guides(fill = guide_legend(ncol = 3))
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

``` r
library(ggseg3d)
library(dplyr)

ggseg3d(atlas = destrieux_3d) %>% 
  pan_camera("right lateral")
```

<img src="man/figures/README-3d-plot.png" width="100%" />

## Source annotation files

The FreeSurfer `aparc.a2009s` annotation files (`lh.aparc.a2009s.annot`,
`rh.aparc.a2009s.annot`) in `data-raw/` are copied from the fsaverage5
subject distributed with [FreeSurfer](https://surfer.nmr.mgh.harvard.edu/)
(v7.4.1), located at `$FREESURFER_HOME/subjects/fsaverage5/label/`.

Reference: Destrieux C, Fischl B, Dale A, Halgren E (2010). Automatic
parcellation of human cortical gyri and sulci using standard anatomical
nomenclature. *NeuroImage*, 53(1), 1-15.
doi:[10.1016/j.neuroimage.2010.06.010](https://doi.org/10.1016/j.neuroimage.2010.06.010)

Please note that the 'ggsegdestrieux' project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to
this project, you agree to abide by its terms.
