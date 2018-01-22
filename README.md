# Useful Article Output Functions for R

This R packages provides some functions to produce article-ready output for commonly used methods in the psychological sciences: currently it supports (Bayesian) t-tests and ezANOVAs.

## Getting Started

### Prerequisites
```R
library(stats)
library(coda)
library(lsr)
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

### Usage
```R
> # One-sample t-test
> article.ttest(tt)
[1] "M = -9 ms; t(126) = -0.69, p = .493, 95% CI [-35 ms, 17 ms]"
 
> # two-sample t-test
> article.ttest(tt)
[1] "693 ms vs 702 ms; t(249.53) = -0.47, p = .639, 95% CI [-48 ms, 29 ms]"

> # t.test, Cohens D, Bayesian ttest
> article.ttest_full(tt,d,BF)
[1] "693 ms vs 702 ms; t(249.53) = -0.47, p = .639, dz = 0.06, 95% HPD [-34 ms, 16 ms], BF10 = 0.12"

> # ezANOVA
> article.ezANOVA(aov)
[1] "The main effect distractor_type was not significant: F(1, 181) = 3.12, p = .079; The main effect target_pos was significant: F(1, 181) = 10.71, p = .001; The interaction distractor_type X target_pos was significant: F(1, 181) = 5.58, p = .019"
```
## Contributing

Feel free to create forks and pull requests.

## Authors

* **Marian Sauter** - *Initial work*

## License

This project is licensed under the GNU Public License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments
