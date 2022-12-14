% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotcorr.R
\name{plotcorr}
\alias{plotcorr}
\title{plotcorr}
\usage{
plotcorr(data, marginal = FALSE)
}
\arguments{
\item{data}{dataframe; the result of a \code{rcorr} function call}

\item{marginal}{logical; if TRUE two univariate boxplots are placed outside the main plot}
}
\value{
a ggplot object
}
\description{
plotcorr
}
\examples{
dat <- rcorr(n = 100, r = 0.5)
plotcorr(dat, marginal = TRUE)
}
