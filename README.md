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
[View Output](https://chr1swallace.github.io/elisa-learner-paper/load-and-explore-data.html)
```{sh}
Rscript -e 'rmarkdown::render("load-and-explore-data.Rmd",output_dir="docs")'
```

Generate different ML probabilistic predictions (qR.rb is simply a wrapper script for Rscript that runs a job on the HPC)
```{sh}
## Rscript univar_cv_mods.R > univar_cv_mods.log 2>&1 ## univariate models (fixed cut-off & ML/stats); CV on historical data
qR.rb -r -c 10 -l univar_cv_mods.log univar_cv_mods.R ## univariate models (fixed cut-off & ML/stats); CV on historical data

##Rscript ml_code.R > ml_code.log 2>&1 ## bivariate models (ML/stats); CV on historical data
qR.rb -r -c 10 -l ml_code.log ml_code.R ## bivariate models (ML/stats); CV on historical data

Rscript elisa_finals.R > elisa_finals.log 2>&1 ## training bivariate models (ML/stats) on the historical data, predicting on BD/pregnant women
Rscript 3sd_univar_mods.R > 3sd_univar_mods.log 2>&1 ## univariate models (fixed cut-off & ML/stats); train on historical data, predict on BD/pregnant women
```

## Compare different ML methods ("bake off"). 
[View Output](https://chr1swallace.github.io/elisa-learner-paper/bake-off.html)
```{sh}
Rscript -e 'rmarkdown::render("bake-off.Rmd",output_dir="docs")'
```

plot decision boundaries

``` r
Rscript create_prob_grid.R > create_prob_grid.log 2>&1 ## create grid for plotting decision boundaries
Rscript figure-probpositive.R >& figure-probpositive.log

```

## Estimate seroprevalence
[View Output](https://chr1swallace.github.io/elisa-learner-paper/population-inference.html)
```{sh}
Rscript -e 'rmarkdown::render("population-inference.Rmd",output_dir="docs")'
```


## Patient data
[View Output](https://chr1swallace.github.io/elisa-learner-paper/explore-patient-data.html)
```{sh}
Rscript -e 'rmarkdown::render("explore-patient-data.Rmd",output_dir="docs")'
```

