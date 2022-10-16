#' plotcorr
#'
#' @param data dataframe; the result of a `rcorr` function call
#' @param marginal logical; if TRUE two univariate boxplots are placed outside the main plot
#' @import ggplot2 ggExtra
#' @return a ggplot object
#' @export
#'
#' @examples
#' dat <- rcorr(n = 100, r = 0.5)
#' plotcorr(dat, marginal = TRUE)
plotcorr <- function(data, marginal = FALSE){
  title <- sprintf("\u03C1 = %s", round(cor(data$x, data$y), 2))
  plt <- ggplot(data, aes(x = x, y = y)) +
    geom_point(size = 3) +
    theme_minimal(base_size = 20) +
    geom_smooth(formula = y ~ x, method = "lm", se = FALSE) +
    ggtitle(title)
  
  if(marginal){
    ggExtra::ggMarginal(plt, type = "boxplot",
                        size = 8,
                        xparams = list(fill = "lightblue"),
                        yparams = list(fill = "salmon"))
  }else{
    plt
  }
}
