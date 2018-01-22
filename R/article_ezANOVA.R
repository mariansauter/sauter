########################################################
#### article_ttest.R
#### Written by Marian Sauter, 2018
#### Documentation: http://github.com/mariansauter/sauter/
########################################################
#' Article-output ezANOVA
#'
#' Produces article-ready APA output for an ezANOVA object
#' @param aov the output object of an ezANOVA
#' @keywords ezANOVA APA article
#' @export
#' @examples
#' @return string vector giving the formatted article text
#' article.ezANOVA()
article.ezANOVA <- function(aov=NULL) {
  
  string <- ""
  
  for(i in 1:nrow(aov$ANOVA)){
    if(aov$ANOVA$Effect[i] != "(Intercept)"){
      effect <- paste(gsub(":", " X ", aov$ANOVA$Effect[i])," ",sep="")
      sig <- ifelse(aov$ANOVA$`p<.05`[i] == "*", "significant", "not significant")
      
      if(grepl(" X ", effect)) text <- paste("The interaction ",effect, "was ",sig,": ",sep="")
      else text <- paste("The main effect ",effect, "was ",sig,": ",sep="")
      
      DFn <- aov$ANOVA$DFn[i]
      DFd <- aov$ANOVA$DFd[i]
      f <- round(aov$ANOVA$F[i],digits=2)
      
      peta <- round(aov$ANOVA$SSn[i]/(aov$ANOVA$SSn[i]+aov$ANOVA$SSd[i]), digits = 2)
      
      p <- round(aov$ANOVA$p[i],digits=3)
      if(p < 0.001) p <- "p < .001"
      else p <- paste("p = ",substring(toString(p), 2),sep="")
      
      substring <- paste(
        text,
        "F(",DFn,", ",DFd,") = ",f, 
        ", ",p, 
        ", p-eta^2 = ",peta,
        sep="")
      
      string <- paste(string, substring, sep="; ")
    }
  }
  
  return(substring(string,3))
}
