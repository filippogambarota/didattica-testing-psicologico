#' Ztest
#'
#' @param x.media the sample mean
#' @param n the sample size
#' @param mi the population mean
#' @param sigma the population standard deviation
#'
#' @return a dataframe with the z value and the bidirectional p value
#' @export
#'
#' @examples
#' Ztest(0.3, 40, 0, 1)
Ztest <- function(x.media, n, mi, sigma) {
  z.oss <- (x.media - mi ) / (sigma / sqrt(n))
  p.value <- pnorm(-abs(z.oss), 0, 1) * 2
  ris <- data.frame(z.oss, p.value)
  return(ris)
}