
# bigPint: Make BIG data pint-sized <img src="man/figures/logo.png" align="right" alt="" />

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active) [![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/lrutter/bigPint/graphs/commit-activity) [![minimal R version](https://img.shields.io/badge/R%3E%3D-3.4.1-6666ff.svg)](https://cran.r-project.org/) [![Last-changedate](https://img.shields.io/badge/last%20change-2018--10--10-blue.svg)](/commits/master) [![packageversion](https://img.shields.io/badge/Package%20version-0.99.0-orange.svg?style=flat-square)](commits/master) [![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-ff69b4.svg)](https://www.gnu.org/licenses/gpl-3.0)

> **BIG** multivariate data **P**lotted **INT**eractively.

Getting Started
---------------

Welcome to the `bigPint` package website! Please visit the [package website](https://lrutter.github.io/bigPint/index.html) to learn how to use this software. There, you can access vignettes, function documentation, and recent news about the package.

------------------------------------------------------------------------

In a nutshell
-------------

The `bigPint` software aims to **"Make BIG data pint-sized"**. You can easily create modern and effective plots for your large multivariate datasets. These plots allow you to quickly examine the variability between all samples in your dataset, assess the varability between treatment groups versus between replicate groups, check for normalization issues, and discover outliers in your dataset. They also allow you to superimpose a subset of observations onto your full dataset to better understand how data subsets relates to your whole dataset. Both static and interactive plots are available.

------------------------------------------------------------------------

RNA-sequencing visualization
----------------------------

The `bigPint` package can be useful for examining any large multivariate dataset. However, we note that the example datasets and example code in this package consider [RNA-sequencing datasets](https://en.wikipedia.org/wiki/RNA-Seq). If you are using this software for RNA-sequencing data, then it can help you confirm that the variability between your treatment groups is larger than that between your replicates and determine how various normalization techniques in popular RNA-sequencing analysis packages (such as [edgeR](https://bioconductor.org/packages/release/bioc/html/edgeR.html), [DESeq2](https://bioconductor.org/packages/release/bioc/html/DESeq2.html), and [limma](https://bioconductor.org/packages/release/bioc/html/limma.html)) affect your dataset. Moreover, you can easily superimpose lists of differentially expressed genes (DEGs) onto your dataset to check that they show the expected patterns (large variability between treatment groups and small variability between replicates).

------------------------------------------------------------------------

Motivation
----------

Large multivariate datasets are common across numerous disciplinary fields. The best approach for looking at quantitative multivariate data are scatterplot matrices; parallel coordinate plots; and replicate line plots. Each of these plots enable assessing the association between multiple variables. With effective plotting tools, analysts can improve modeling; they can iterate between visualizations and modeling to enhance the models based on feedback from the visuals.

However, these plots are ineffective with large quantities of data: Overplotting can obscure important structure, and the plots can be slow to render if every observation is mapped to a graphical element. In this package, we developed more useful visualization techniques for large multivariate datasets by incorporating appropriate summaries and using interactivity.