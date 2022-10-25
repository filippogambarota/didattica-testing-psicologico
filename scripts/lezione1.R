# Lezione 1 - Script

# Creazione vettori
x <- 1:6
x <- c(1,2,3,4,5,6)

# nomi vs caratteri
# il nome è l'etichetta che associamo ad un oggetto R
ciao <- 8 # ciao è un nome
"ciao" # ciao è un carattere

# cosa succede quando caratteri e numeri co-esistono in un vettore?
y <- c(5:10, "ciao", "ciao")

# indicizzazione logica
y == "ciao"

# indicizzazione intera
which(y == "ciao")

# indicizzazione negativa
y[-which(y =="ciao")] # 
y[-c(7, 8)]

# il comando unique() restituisce tutti i valori unici di un vettore

unique(c(1,2,2,3,3,4,5,5,5))

# letters e LETTERS sono due oggetti già presenti in R che contengono tutte
# le lettere dell'alfabeto
letters
LETTERS

# cosa fa la funzione sample?
?sample

my_vec <- sample(letters[1:5], size = 30, replace = TRUE)
unique(my_vec)
my_vec == "a"
my_vec[my_vec == "a"] # indicizzazione logica
my_vec[which(my_vec == "a")] # indicizzazione intera

my_vec[my_vec == "a" | my_vec == "b"] # operatore OR |
my_vec[my_vec != "a"] # operatore NOT
which(my_vec == "a" | my_vec == "b") # da logico a intero
