
<!-- README.md is generated from README.Rmd. Please edit that file -->

# erebor

<img src="https://github.com/rainoffallingstar/ereboR/tree/master/dev/erebor.png" height="200" align="right"/>
<!-- badges: start -->

<!-- badges: end -->

The goal of erebor is to build a R6-based package for bulk RNAseq and
RRBS analysis.

## Installation

You can install the development version of sell:

``` r
# FILL THIS IN! HOW CAN PEOPLE INSTALL YOUR DEV PACKAGE?
pak::pak("rainoffallingstar/ereboR")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(erebor)
## the upstream analysis of RNA-seq

BagginsClass$new(...)

## the upstream analysis of RRBS

SamwiseClass$new(...)

## download public data from TGCA/GEO

laml <- MoriaClass$new(mine = "TCGA-LAML",Dwarf_worker = "TGCA")
#laml$download()
```
