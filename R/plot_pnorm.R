#' Plot the result of a pnorm function call
#'
#' @name plot_pnorm
#' @description Plot the result of the \code{pnorm} function. The syntax is the same as the \code{pnorm} function.
#' @param q numeric; The quantile to evaluate the \code{pnorm}
#' @param mean numeric; The mean of the normal distribution
#' @param sd numeric; The standard deviation of the normal distribution
#' @param lower.tail logical; if TRUE (default), probabilities are \eqn{P[X \le x]} otherwise, \eqn{P[X > x]}.
#' @import ggplot2
#' @return ggplot object
#' @export
#' @examples
#' plot_pnorm(0.5, 0, 1, lower.tail = TRUE)
#' 
plot_pnorm <- function(q = NULL, mean = 0, sd = 1, lower.tail = TRUE){
  
  plt <- ggplot2::ggplot(data.frame(x = c(mean - 4*sd, mean + 4*sd)), aes(x)) +
    ggplot2::stat_function(fun = dnorm, args = list(mean = mean,
                                           sd = sd),
                  size = 1) +
    ggplot2::theme_minimal(base_size = 20) +
    ggplot2::theme(plot.title = element_text(size = 15)) +
    ggplot2::ylab("dnorm(x)") +
    ggplot2::xlab("quantile")
  
  if(!is.null(q)){
    
    if(length(q) == 1){
      pnorm_res <- sprintf("pnorm(q = %s, mean = %s, sd = %s) = %s",
                           q, mean, sd, 
                           round(pnorm(q, mean, sd, lower.tail = lower.tail), 3)) 
      
      plt <- plt +
        ggplot2::ggtitle(pnorm_res) +
        ggplot2::geom_vline(xintercept = q, linetype = "dashed")
      
      if(lower.tail){
        plt +
          ggplot2::stat_function(fun = dnorm, geom = "area", args = list(mean = mean,
                                                                sd = sd),
                        xlim = c(mean-4*sd, q), fill = "red", alpha = 0.3)
      }else{
        plt +
          ggplot2::stat_function(fun = dnorm, geom = "area", args = list(mean = mean,
                                                                sd = sd),
                        xlim = c(q, mean+4*sd), fill = "red", alpha = 0.3)
      }
    }else{
      minq <- q[which.min(q)]
      maxq <- q[which.max(q)]
      pnorm_op <- pnorm(maxq, mean, sd, lower.tail = TRUE) - 
        pnorm(minq, mean, sd, lower.tail = TRUE)
      
      pnorm_res <- sprintf("pnorm(%s, %s, %s) - pnorm(%s, %s, %s) = %s",
                           maxq, mean, sd,
                           minq, mean, sd,
                           round(pnorm_op, 3))
      
      plt + 
        ggplot2::stat_function(fun = dnorm, geom = "area", args = list(mean = mean,
                                                              sd = sd),
                      xlim = c(minq, maxq), fill = "red", alpha = 0.3) +
        ggplot2::geom_vline(xintercept = q, linetype = "dashed") +
        ggplot2::ggtitle(pnorm_res)
    }
  }else{
    plt
  }
}





