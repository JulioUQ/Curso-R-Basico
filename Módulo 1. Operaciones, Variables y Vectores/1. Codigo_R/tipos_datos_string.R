#---------------------------------------------
#                  String                   -
#---------------------------------------------

# Nombre del barco
barco <- "PezVeloRápido123"

# Cuántos caracteres tiene el nombre del barco
nchar_barco <-  nchar(barco)
nchar_barco

# Convertir a mayúsculas o minúsculas todo el string
tolower(barco)
toupper(barco)

# Obtener un pedazo (substring) del nombre del barco
substr(barco, 1,3)  # Primeras 5 letras
tail_length <- nchar_barco
substr(barco, 6, tail_length)  # Desde la sexta letra hasta el final

# Sustituir valores del string
sub("á","A", barco)
gsub("a","A",barco)
sub("Pez","Barco", barco)

# Pegar (Concatenar) dos o más strings
paste("El nombre de mi barco es:", barco, sep = " ")

#----- Ejercicio

mensaje <- "El pez dorado es una especie increíblemente rápida y resistente"

mensaje_mod <- sub("pez dorado", "pez espada", mensaje)

paste("En las aguas abiertas:", mensaje_mod, sep = " ")

# Peso de una captura
peso <- 7.5

peso == 9  # ¿El pez pesa exactamente 9 kg?

peso > 7 & peso < 8  # ¿El peso está entre 7 y 8 kg?

peso_dia1 <- 8.5
peso_dia2 <- 5.7

peso_dia1 < 6 | peso_dia2 < 6  # ¿Algún pez pesó menos de 6 kg?

# Verificar si el nombre del barco contiene una palabra específica
barco <- "ReyDelMar123"

grepl("Mar", barco)
