---
title: "Estimated seropositivity weeks 17-21"
author: "Stasia Grinberg, Chris Wallace"
date: "`r format(Sys.time(), '%d %B %Y')`"
output: html_document
---

# Seroprevalence

Code used in analysis of seroprevalence data in
> Disease-associated antibody phenotypes and probabilistic seroprevalence estimates during the emergence of SARS-CoV-2. De Castro et al,

Authors: [Chris Wallace](https://github.com/chr1swallace), [Stasia Grinberg](https://github.com/stas-g)

## Seroprevalence data

Clean and tidy input data

```{sh}
Rscript -e 'rmarkdown::render("load-and-explore-data.Rmd")'
```

Generate different ML probabilistic predictions

```{sh}
Rscript univar_cv_mods.R > univar_cv_mods.log 2>&1 ## univariate models (fixed cut-off & ML/stats); CV on historical data
Rscript ml_code.R > ml_code.log 2>&1 ## bivariate models (ML/stats); CV on historical data
Rscript elisa_finals.R > elisa_finals.log 2>&1 ## training bivariate models (ML/stats) on the historical data, predicting on BD/pregnant women
Rscript 3sd_univar_mods.R > 3sd_univar_mods.log 2>&1 ## univariate models (fixed cut-off & ML/stats); train on historical data, predict on BD/pregnant women
Rscript create_prob_grid.R > create_prob_grid.log 2>&1 ## create grid for plotting decision boundaries
```

Compare different ML methods ("bake off")
```{sh}
Rscript -e 'rmarkdown::render("bake-off.Rmd")'
```

## Estimate seroprevalence
```{sh}
Rscript -e 'rmarkdown::render("population-inference.Rmd")'
```


## Patient data

```{sh}
Rscript -e 'rmarkdown::render("explore-patient-data.Rmd")'
```
