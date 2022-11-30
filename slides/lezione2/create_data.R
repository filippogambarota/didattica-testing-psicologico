nsample <- c(100, 30, 25, 10)
ses_lev <- c("alto", "medio", "basso")

diagnosi <- c("depressione", "ansiasociale", "ocd", "bipolare")

ses <- c(
  sample(ses_lev, nsample[1], p = c(2/3, 1/3, 1/3), replace = TRUE),
  sample(ses_lev, nsample[2], p = c(1/3, 1/3, 1/3), replace = TRUE),
  sample(ses_lev, nsample[3], p = c(1/3, 1/3, 1/3), replace = TRUE),
  sample(ses_lev, nsample[4], p = c(0.1, 0.2, 0.7), replace = TRUE)
)

eta <- c(
  round(rnorm(nsample[1], 30, 10)),
  round(rnorm(nsample[2], 20, 5)),
  round(rnorm(nsample[3], 18, 3)),
  round(rnorm(nsample[4], 40, 5))
)

dep_score <- c(
  rnorm(nsample[1], 80, 15),
  rnorm(nsample[2], 40, 10),
  rnorm(nsample[3], 10, 12),
  rnorm(nsample[4], 10, 20)
)

ans_score <- c(
  rnorm(nsample[1], 40, 15),
  rnorm(nsample[2], 70, 10),
  rnorm(nsample[3], 70, 12),
  rnorm(nsample[4], 10, 20)
)

self_esteem_score <- c(
  sample(1:6, nsample[1], p = c(0.4, 0.2, 0.1, 0.1, 0.1, 0.1), replace = TRUE),
  sample(1:6, nsample[2], p = c(0.4, 0.2, 0.1, 0.1, 0.1, 0.1), replace = TRUE),
  sample(1:6, nsample[3], p = c(0.2, 0.4, 0.1, 0.1, 0.1, 0.1), replace = TRUE),
  sample(1:6, nsample[4], p = c(0.1, 0.1, 0.1, 0.1, 0.3, 0.4), replace = TRUE)
)

dep_score <- round(dep_score)
dep_score <- ifelse(dep_score > 100, 100, dep_score)
dep_score <- ifelse(dep_score < 0, 0, dep_score)

ans_score <- round(ans_score)
ans_score <- ifelse(ans_score > 100, 100, ans_score)
ans_score <- ifelse(ans_score < 0, 0, ans_score)

dat <- data.frame(
  eta,
  diagnosi = rep(diagnosi, nsample),
  ses,
  dep_score,
  ans_score,
  self_esteem_score)

new_rows <- dat[sample(1:nrow(dat), 20), ]
new_rows$diagnosi <- "altro"

dat <- rbind(dat, new_rows)
dat <- dat[sample(1:nrow(dat)), ]
rownames(dat) <- 1:nrow(dat)

dat <- filor::put_random_na(dat, 15)
dat$eta[sample(1:nrow(dat), 15)] <- 0
write.table(dat, "data/psych.csv", sep = ";", row.names = FALSE)
