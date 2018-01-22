# Useful Article Output Functions for R

This R packages provides some functions to produce article-ready output for commonly used methods in the psychological sciences: currently it supports (Bayesian) t-tests and ezANOVAs.

## Getting Started

### Prerequisites
```R
library(stats)
library(cohensD)
library(BayesFactor)
```

### Installing
If you have library("devtools") installed, this package can be installed with
```
install_github('sauter','mariansauter')
```
Alternatively, you can include the individual functions by including the following line in the beginning of your R script
```R
if(!exists("article.ttest", mode="function")) source("https://raw.githubusercontent.com/mariansauter/sauter/master/R/article_ttest.R")
if(!exists("article.ttest_full", mode="function")) source("https://raw.githubusercontent.com/mariansauter/sauter/master/R/article_ttest.R")
if(!exists("article.ezANOVA", mode="function")) source("https://raw.githubusercontent.com/mariansauter/sauter/master/R/article_ezANOVA.R")
```

## Contributing

Feel free to create forks and pull requests.

## Authors

* **Marian Sauter** - *Initial work*

## License

This project is licensed under the GNU Public License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments
