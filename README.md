
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

### root_dir 是放bam文件的目录
### 注意，这个包在运行结束后会将bam文件拷贝到processed目录
samwise <- erebor::SamwiseClass$new(root_dir = ".",
                         methyratio_py = "methratio.py",
                         gene_fa = "Genedata/hg19.fa")
# 提取甲基化位点，并转化为bismark_cov格式,
#可以指定一个装有python2.7的conda环境(如果不为NULL)
samwise$bam2methyratio(save2bismark = T,use_conda_env = "py27",
                       cores = 16,
                       mem = 100000)

## download public data from TGCA/GEO

laml <- MoriaClass$new(mine = "TCGA-LAML",Dwarf_worker = "TGCA")
#laml$download()
```
