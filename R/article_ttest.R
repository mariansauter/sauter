########################################################
#### Article-output functions for common statistical tests
#### Written by Marian Sauter, 2017
#### Version 0.3 - 24.02.17
########################################################
#' Article-output for a t.test (Simple)
#'
#' Produces article-ready APA output for an t.test-object, including test statistic, p-value and confidence intervals
#' @param obj the output object of an t.test function (stats package)
#' @param unit the measurement unit, defaults to 'ms'
#' @keywords t.test APA article
#' @export
#' @examples
#' @return string vector giving the formatted article text
#' article.ttest()
article.ttest <- function(obj=NULL, unit="ms") {
  
  estimatex <- signif(unname(obj$estimate[1]),4)
  estimatey <- NULL
  if(!is.na(obj$estimate[2])) estimatey <- signif(unname(obj$estimate[2]),4)
  df <- round(unname(obj$parameter),digits=2)
  statistic <- round(unname(obj$statistic),digits=2)
  
  p <- round(unname(obj$p.value),digits=3)
  if(p < 0.001) p <- "p < .001"
  else p <- paste("p = ",substring(toString(p), 2),sep="")
  
  ci1 <- signif(as.numeric(obj$conf.int[1]),4)
  ci2 <- signif(as.numeric(obj$conf.int[2]),4)
  
  if(is.null(estimatey)) est_string = paste("M = ", estimatex," ",unit, sep="") 
  else est_string = paste(estimatex," ",unit," vs ",estimatey," ",unit, sep="")
  
  string <- paste(
    est_string,
    "; t(",df,") = ",statistic, 
    ", ",p, 
    ", 95% CI [",ci1, " ",unit, ", ",ci2," ",unit,"]",
    sep="")
  
  return(string)
}

#' Comprehensive Article-output for a t.test 
#'
#' Produces article-ready APA output for an t.test-object, including test statistic, p-value, Cohen's D, BayesFactor and Highest Posterior Density Interval
#' @param obj the output object of an t.test function (stats package)
#' @param dz output from cohensD() function (CohensD package)
#' @param BF output from ttestBF()-function (BayesFactor package)
#' @param unit the measurement unit, defaults to 'ms'
#' @keywords t.test APA article
#' @export
#' @examples
#' @return string vector giving the formatted article text
#' article.ttest_full()
article.ttest_full <- function(obj=NULL, dz=NULL, BF=NULL,unit="ms") {
  
  library(coda)
  library(BayesFactor)
  
  d <- dz
  estimatey <- NULL
  estimatex <- signif(unname(obj$estimate[1]),4)
  if(!is.na(obj$estimate[2])) estimatey <- signif(unname(obj$estimate[2]),4)
  df <- round(unname(obj$parameter),digits=2)
  statistic <- round(unname(obj$statistic),digits=2)
  
  p <- round(unname(obj$p.value),digits=3)
  if(p < 0.001) p <- "p < .001"
  else p <- paste("p = ",substring(toString(p), 2),sep="")
  
  hpd <- HPDinterval(invisible(posterior(BF, iterations = 10000)))
  ci1 <- signif(HPDinterval(BFsamples)[1,1],4)
  ci2 <- signif(HPDinterval(BFsamples)[1,2],4)
  cip <- attr(HPDinterval(BFsamples), "Probability")
  
  if(is.null(estimatey)) est_string = paste("M = ", estimatex," ",unit, sep="") 
  else est_string = paste(estimatex," ",unit," vs ",estimatey," ",unit, sep="")
  
  bayes <- signif(extractBF(BF)$bf, 4)
  
  string <- paste(
    est_string,
    "; t(",df,") = ",statistic, 
    ", ",p, 
    ", dz = ",round(d, digits=2),
    ", ",cip*100, "% HPD [",ci1, " ",unit, ", ",ci2," ",unit,"]",
    ", BF10 = ",bayes,
    sep="")
  
  return(string)
}