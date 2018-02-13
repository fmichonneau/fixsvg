
[![Travis build status](https://travis-ci.org/fmichonneau/fixsvg.svg?branch=master)](https://travis-ci.org/fmichonneau/fixsvg)

<!-- README.md is generated from README.Rmd. Please edit that file -->
**`fixsvg`**
============

The goal of **`fixsvg`** is to edit SVG files automatically to work around a [Firefox bug](https://bugzilla.mozilla.org/show_bug.cgi?id=1437660).

Installation
------------

You can install fixsvg from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("fmichonneau/fixsvg")
```

Example
-------

This package contains a single exported function, `fix_clip_path()` that takes as an argument the path of a project that may contain SVG files containing the `clip-path` element:

``` r
fix_clip_path("my-website")
```
