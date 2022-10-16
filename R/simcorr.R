#' rcorr
#' @description generate two correlated variables
#' @param mux mean of the first variable (x), default to 0
#' @param muy mean of the second variable (y), default to 0
#' @param n sample size
#' @param sdx standard deviation of the first variable (x), default to 1
#' @param sdy standard deviation of the second variable (y), default to 1
#' @param r the correlation between x and y
#'
#' @return a dataframe
#' @export
#' @importFrom MASS mvrnorm
#' @examples
#' rcorr(n = 100, r = 0.6)
rcorr <- function(mux = 0, muy = 0, n, sdx = 1, sdy = 1, r){
  corMat <- matrix(c(1, r,
                     r, 1),
                   nrow = 2,
                   byrow = TRUE)
  # https://stats.stackexchange.com/a/164476
  covMat <- c(sdx, sdy) %*% t(c(sdx, sdy)) * corMat
  out <- MASS::mvrnorm(n, mu = c(mux, muy), Sigma = covMat)
  out <- data.frame(out)
  names(out) <- c("x", "y")
  return(out)
}
