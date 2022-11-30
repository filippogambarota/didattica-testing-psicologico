# Ricodificare Items

# simulo i valori di 8 item e 30 soggetti
dat <- data.frame(
  item1 = sample(1:5, 30, replace = TRUE),
  item2 = sample(1:5, 30, replace = TRUE),
  item3 = sample(1:5, 30, replace = TRUE),
  item4 = sample(1:5, 30, replace = TRUE),
  item5 = sample(1:5, 30, replace = TRUE),
  item6 = sample(1:5, 30, replace = TRUE),
  item7 = sample(1:5, 30, replace = TRUE),
  item8 = sample(1:5, 30, replace = TRUE)
)

# creo una funzione che ricodifica
# ?dplyr::case_when()

ricodifica1 <- function(x){
  abs(x - 6)
}

ricodifica2 <- function(x){
  dplyr::case_when(x == 1 ~ 5,
                   x == 2 ~ 4,
                   x == 3 ~ 3,
                   x == 4 ~ 2,
                   x == 5 ~ 1)
}

# ricodifico tutti gli item

dat$item1 # originale
ricodifica1(dat$item1) # metodo 1
ricodifica2(dat$item1) # metodo 2

# all() restituisce TRUE solo quando tutti sono TRUE
# usare ricodifica1 o ricodifica2 non cambia
all(ricodifica1(dat$item1) == ricodifica2(dat$item1))

# applico la funzione a tutte le colonne
# usiamo lapply(lista, funzione)
# i dataframe sono liste di colonne -> applico una funzione
# a tutte le colonne

lapply(dat, ricodifica1)
lapply(dat, ricodifica2)

# ricodifico solo alcuni item

item_da_ricodificare <- c(1, 4, 8)
# seleziono solo le colonne da ricodificare
lapply(dat[, item_da_ricodificare], ricodifica1)
lapply(dat[, item_da_ricodificare], ricodifica2)

# sapply non funziona bene
sapply(dat[, item_da_ricodificare], ricodifica1)

dat_rec <- lapply(dat[, item_da_ricodificare], ricodifica2)

# unisco il dataset senza gli item da ricodificare
# con quelli nuovi che abbiamo ricodificato
dat_new <- cbind(dat[, -item_da_ricodificare], dat_rec)


