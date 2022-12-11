# correlated data

datw  <- faux::rnorm_multi(100, 3, 0, 1, 
                          r = c(0.2, -0.5, 0.2), 
                          varnames=c("A", "B", "C"))

datl <- tidyr::pivot_longer(datw, 1:ncol(datw))

dat <- list(datl = datl, datw = datw)

saveRDS(dat, "slides/lezione4/cordat.rds")
