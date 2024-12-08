template_content <- '
---
params:
  df1_input: df1_input
  df2_input: df2_input
  id_input: id_input
  title_input: title_input
  author_input: author_input
  context_input: context_input
date: "`r Sys.Date()`"
title: "`r params$title_input`"
author: "`r params$author_input`"
output: 
  html_document:
    toc: true
    number_sections: true
    toc_depth: 2
    toc_float:
      collapsed: false
      smooth_scroll: false
  
---

<!-- badges: start -->
[![CRAN status](https://www.r-pkg.org/badges/version/dataCompare)](https://CRAN.R-project.org/package=dataCompare)
[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
<!-- badges: end -->


```{r setup, echo=FALSE, warning=FALSE, message=FALSE}
library(dplyr)
```


# Context of the report

`r params$context_input`


# Comparison results {.tabset}
  
```{r echo=FALSE, message=FALSE, warning=FALSE}
comparison <- dataCompare::compare_data_frame_object(params$df1_input, params$df2_input, params$id_input)
```
  
  
## difference percentage

```{r echo=FALSE}
comparison$diff_percentage
```

## frame summary table

```{r echo=FALSE}
dataCompare::data_table_formatter( comparison$frame.summary.table, n_page = 20 )
```


## attributs table

```{r echo=FALSE}
dataCompare::data_table_formatter( comparison$attrs.table, n_page = 20 )
```


## comparison summary table

```{r echo=FALSE}
dataCompare::data_table_formatter( comparison$comparison.summary.table, n_page = 20 )
```


## variables not shared table

```{r echo=FALSE}
dataCompare::data_table_formatter( comparison$vars.ns.table, n_page = 20 )
```

## variables not compared table

```{r echo=FALSE}
dataCompare::data_table_formatter( comparison$vars.nc.table, n_page = 20 )
```

## observations table

```{r echo=FALSE}
dataCompare::data_table_formatter( comparison$obs.table, n_page = 20 )
```

## differences by variables table

```{r echo=FALSE}
dataCompare::data_table_formatter( comparison$diffs.byvar.table, n_page = 20 )
```

## differences by observation table

```{r echo=FALSE}
dataCompare::data_table_formatter( comparison$diffs.table, n_page = 20 )
```
'