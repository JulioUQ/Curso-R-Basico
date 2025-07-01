#---------------------------------------------
#                  Vectores                  -
#---------------------------------------------

#----- Definicion de vectores

# Vector numerico (Capturas de peces en diferentes días)
capturas <- c(21, 34, 15, 29, 40, 18, 27)

# Vector de caracteres (Nombres de los lugares de pesca)
lugares <- c("Lago Azul", "Río Claro", "Mar del Norte", "Bahía Dorada",
             "Lago Verde", "Río Bravo", "Costa Serena")

#----- Operaciones basicas

# Cuántos lugares de pesca tenemos?
length(capturas)

# Cuántos peces se capturaron en el lugar más productivo?
max(capturas)

# Cuántos peces se capturaron en el lugar menos productivo?
min(capturas)

# Cuántos peces se capturaron en promedio en todos los lugares?
mean(capturas)

# En total, cuántos peces se capturaron en todos los lugares?
sum(capturas)

# Operaciones aplicadas al vector
capturas + 5  # Añadir 5 peces a cada lugar
capturas / 2  # Dividir entre dos las capturas
log(capturas)  # Logaritmo de las capturas
nchar(lugares)  # Longitud de los nombres de los lugares

# Añadimos un nuevo lugar de pesca
capturas <- c(capturas, 35)
lugares <- c(lugares, "Isla Escondida")

# Ponerle nombre a las entradas de un vector
names(capturas) <- lugares

# Ordenar un vector numerico
sort(capturas)
?sort
sort(capturas, decreasing = TRUE)

#----- Condiciones logicas sobre vectores

# Qué lugares tienen más de 30 peces?
capturas > 30

# Cuántos lugares tienen más de 30 peces?
sum(capturas > 30)

# Algún lugar tiene más de 40 peces?
any(capturas > 40)

# Todos los lugares tienen más de 10 peces?
all(capturas > 10)

# Qué lugares tienen menos de 20 peces?
which(capturas < 20)

#----- Como obtener un subconjunto de un vector

# Especificando cuáles quiero (Enteros positivos)
capturas[c(2,4)]  # Río Claro y Bahía Dorada
capturas[3]  # Mar del Norte

# Especificando cuáles no quiero (Enteros negativos)
capturas[-4]  # Todos menos Bahía Dorada
capturas[-c(2,4)]  # Todos menos Río Claro y Bahía Dorada

# Especificando cuáles quiero (Valores lógicos)
capturas[c(FALSE,TRUE,FALSE,TRUE,FALSE,FALSE,FALSE)]
capturas[capturas > 25]
capturas[capturas > 15 & capturas < 30]

# Mediante el nombre de la entrada
capturas[c("Río Claro", "Bahía Dorada")]

# Cómo modificar una o más entradas de un vector
capturas[1] <- 50  # Lago Azul
capturas[c(2,3,4)] <- c(40, 35, 45)
capturas[capturas > 50] = 50

#----- Utilizando los vectores como conjuntos

# Especies de peces capturados
yo <- c("Trucha", "Salmón", "Dorado", "Carpa")
amigo <- c("Tilapia", "Dorado", "Robalo", "Trucha")

# Qué especies capturamos entre los dos?
union(yo, amigo)

# Qué especies tenemos en común?
intersect(yo, amigo)

# Qué especies capturé que mi amigo no capturó?
setdiff(yo, amigo)

# Tenemos las mismas especies?
setequal(yo, amigo)

# Mi amigo capturó un Dorado?
"Dorado" %in% amigo

# Mi amigo capturó una Trucha o un Robalo?
c("Trucha", "Robalo") %in% amigo

#----- Ejercicio 1

# Numeros del 1 al 100, representando diferentes puntos de pesca
puntos <- 1:100

# Calcular cuántos de estos puntos son múltiplos de 6 y 8
sum(puntos %% 6 == 0 & puntos %% 8 == 0)

#----- Ejercicio 2

# Definicion del vector
set.seed(123)
pesos <- rnorm(n = 10000, mean = 3, sd = 0.8)  # Pesos en kg de peces capturados

# Cuáles son los pesos de los peces en las posiciones 435 y 678
pesos[c(435, 678)]

# Cuántos peces pesaron más de 5 kg?
sum(pesos > 5)

# Peso máximo y mínimo
max(pesos)
min(pesos)

# Qué porcentaje de peces pesaron entre 2 y 4 kg?
sum(pesos >= 2 & pesos <= 4) / length(pesos)
mean(pesos >= 2 & pesos <= 4)

#----- Ejercicio 3

# Verificar si un nombre de embarcación es válido
barco <- "PezVeloRápido123"

# Al menos un número?
any(strsplit(barco, split = "")[[1]] %in% 1:9)

# Solamente números?
all(strsplit(barco, split = "")[[1]] %in% 1:9)




