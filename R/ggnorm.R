#' Plot the result of a pnorm function call
#'
#' @name ggnorm
#' @description Plot the result of the \code{pnorm} function. The syntax is the same as the \code{pnorm} function.
#' @param q numeric; The quantile to evaluate the \code{pnorm}
#' @param mean numeric; The mean of the normal distribution
#' @param sd numeric; The standard deviation of the normal distribution
#' @param lower.tail logical; if TRUE (default), probabilities are \eqn{P[X \le x]} otherwise, \eqn{P[X > x]}.
#' @import ggplot2
#' @return ggplot object
#' @export
#' @examples
#' ggnorm(0.5, 0, 1, lower.tail = TRUE)
#' 
ggnorm <- function(q = NULL, mean = 0, sd = 1, lower.tail = TRUE, within = TRUE){
  
  require(ggplot2)
  
  # draw base plot
  plt <- ggplot(data.frame(x = c(mean - 4*sd, mean + 4*sd)), aes(x)) +
    stat_function(fun = dnorm, args = list(mean = mean,
                                           sd = sd),
                  size = 1) +
    theme_minimal(base_size = 20) +
    theme(plot.title = element_text(size = 15)) +
    ylab("dnorm(x)") +
    xlab("x")
  
  # distribution parameters
  basetitle <- sprintf("\U03BC = %s, \U03C3 = %s", mean, sd)
  
  if(!is.null(q)){
    
    if(length(q) == 1){
      
      if(lower.tail){
        side <- - 1
        pnorm_res <- sprintf("pnorm(q = %s, mean = %s, sd = %s, lower.tail = TRUE) = %.3f",
                             q, mean, sd, 
                             pnorm(q, mean, sd, lower.tail = lower.tail))
      }else{
        side <- 1
        pnorm_res <- sprintf("1 - pnorm(q = %s, mean = %s, sd = %s, lower.tail = TRUE) = %.3f",
                             q, mean, sd, 
                             pnorm(q, mean, sd, lower.tail = lower.tail))
      }
      
      plt <- plt +
        ggtitle(pnorm_res) +
        geom_segment(x = q, xend = q,
                     y = 0, yend = dnorm(q, mean, sd),
                     linetype = "dashed") +
        theme(axis.title.x = element_text(colour="red", face = "bold")) +
        theme(axis.title.y = element_text(colour="blue", face = "bold"))
      
      plt +
        stat_function(fun = dnorm, geom = "area", args = list(mean = mean,
                                                              sd = sd),
                      xlim = c(mean + (4 * side) * sd, q), fill = "red", alpha = 0.3) +
        ggtitle(pnorm_res) +
        geom_point(x = q, y = 0, size = 5, col = "red") +
        geom_point(x = q, y = dnorm(q, mean, sd), size = 5, col = "blue") +
        annotate("text", 
                 x = mean + sd*3, 
                 y = dnorm(mean, mean, sd), 
                 label = basetitle,
                 size = 8)
      
    }else{
      # if two quantiles are given 
      minq <- q[which.min(q)]
      maxq <- q[which.max(q)]
      
      plt <- plt +
        geom_segment(x = q, xend = q,
                     y = 0, yend = dnorm(q, mean, sd),
                     linetype = "dashed") +
        theme(axis.title.x = element_text(colour="red", face = "bold")) +
        theme(axis.title.y = element_text(colour="blue", face = "bold")) +
        geom_point(x = q, y = 0, size = 5, col = "red") +
        geom_point(x = q, y = dnorm(q, mean, sd), size = 5, col = "blue")
      
      if(within){
        pnorm_op <- pnorm(maxq, mean, sd, lower.tail = TRUE) - 
          pnorm(minq, mean, sd, lower.tail = TRUE)
        
        pnorm_res <- sprintf("pnorm(%s, %s, %s, lower.tail = TRUE) - pnorm(%s, %s, %s, lower.tail = TRUE) = %s",
                             maxq, mean, sd,
                             minq, mean, sd,
                             round(pnorm_op, 3))
        plt + 
          stat_function(fun = dnorm, geom = "area", args = list(mean = mean,
                                                                sd = sd),
                        xlim = c(minq, maxq), fill = "red", alpha = 0.3) +
          ggtitle(pnorm_res)  +
          annotate("text", 
                   x = mean + sd*3, 
                   y = dnorm(mean, mean, sd), 
                   label = basetitle,
                   size = 8)
        
      }else{
        pnorm_op <- pnorm(minq, mean, sd, lower.tail = TRUE) + 
          pnorm(maxq, mean, sd, lower.tail = FALSE)
        
        pnorm_res <- sprintf("pnorm(%s, %s, %s, lower.tail = TRUE) + pnorm(%s, %s, %s, lower.tail = FALSE) = %s",
                             minq, mean, sd,
                             maxq, mean, sd,
                             round(pnorm_op, 3))
        plt + 
          stat_function(fun = dnorm, geom = "area", args = list(mean = mean,
                                                                sd = sd),
                        xlim = c(mean - 4*sd, minq), fill = "red", alpha = 0.3) +
          stat_function(fun = dnorm, geom = "area", args = list(mean = mean,
                                                                sd = sd),
                        xlim = c(maxq, mean + 4*sd), fill = "red", alpha = 0.3) +
          ggtitle(pnorm_res) +
          annotate("text", 
                   x = mean + sd*3, 
                   y = dnorm(mean, mean, sd), 
                   label = basetitle,
                   size = 8)
      }
    }
  }else{
    plt + 
      geom_segment(x = mean, xend = mean,
                   y = 0, yend = dnorm(mean, mean, sd),
                   linetype = "dashed") +
      ggtitle(basetitle)
  }
}
