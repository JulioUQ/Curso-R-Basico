#---------------------------------------------
#                  Logical                   -
#---------------------------------------------

# Valores lógicos posibles
TRUE
FALSE

# Peso mínimo para considerar una captura buena
peso_captura <- 6.5

# ¿La captura pasó el peso mínimo?
peso_captura[peso_captura >= 5] 

# ¿La captura está entre 5 y 10 kg?
peso_captura > 5 & peso_captura < 10 

# Profundidad de la pesca en metros
profundidad_pesca <- 250

# ¿Se pescó en aguas profundas o el pez es protegido?
profundidad_pesca > 200 | TRUE  # TRUE aquí representa que el pez es protegido

# ¿No es un pez protegido?
es_protegida <- FALSE
!es_protegida

# Nombre del pescador
pescador <- "El Capitán"

# Validar que el nombre no sea "Pirata"
pescador != "Pirata"

# Validar que el nombre tenga más de 5 caracteres
nchar(pescador) > 5

# Validar que el nombre no contenga la palabra "Capitán"
!grepl("37.1.1", pescador) 

# Validar todas las condiciones anteriores
(nchar(pescador) > 5) & (!grepl("Capitán", pescador)) & (pescador != "Pirata")

# Suma de valores lógicos
TRUE == 1
FALSE == 0
TRUE + FALSE + TRUE  # Resultado 2

#----- Ejercicio -----#
pescador <- "MarineroValiente"
nchar(pescador)
nchar(pescador) < 15 & !grepl("Pirata", pescador) & pescador != "ElJefe"
