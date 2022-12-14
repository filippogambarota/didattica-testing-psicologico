% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ztest.R
\name{Ztest}
\alias{Ztest}
\title{Ztest}
\usage{
Ztest(x.media, n, mi, sigma)
}
\arguments{
\item{x.media}{the sample mean}

\item{n}{the sample size}

\item{mi}{the population mean}

\item{sigma}{the population standard deviation}
}
\value{
a dataframe with the z value and the bidirectional p value
}
\description{
Ztest
}
\examples{
Ztest(0.3, 40, 0, 1)
}
