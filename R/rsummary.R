#' rsummary
#' @description a simple \code{summary()} function with extra statistics
#' @param x a numeric vector
#' @param na.rm logical; remove NA values before applying the functions
#'
#' @return a named vector with summary statistics
#' @export
#'
#' @examples
#' x <- rnorm(100)
#' rsummary(x)
rsummary <- function(x, na.rm = TRUE){
  c(
    min = min(x, na.rm = na.rm),
    quantile(x, probs = 0.25, na.rm = na.rm),
    mean = mean(x, na.rm = na.rm),
    median = median(x, na.rm = na.rm),
    sd = sd(x, na.rm = na.rm),
    cv = sd(x, na.rm = na.rm)/abs(mean(x, na.rm = na.rm)),
    quantile(x, probs = 0.75, na.rm = na.rm),
    max = max(x, na.rm = na.rm)
  )
}