#---------------------------------------------
#                  Numeric                   -
#---------------------------------------------

# Peso de los peces capturados (en kilogramos)
pesos <- c(3.2, 5.8, 2.9, 7.4, 4.3, 8.1, 6.0)

# ----- Operaciones básicas -----

# ¿Cuántos peces se capturaron?
length(pesos)

# ¿Cuál fue el pez más pesado?
max(pesos)

# ¿Cuál fue el pez más ligero?
min(pesos)

# ¿Cuál es el peso promedio de los peces?
mean(pesos)

# ¿Cuánto pesan todos los peces juntos?
sum(pesos)

# ----- Operaciones matemáticas -----

# Aumentar el peso de cada pez en 0.5 kg (por crecimiento)
pesos <- pesos + 0.5

# Reducir el peso de cada pez a la mitad (por fileteado)
pesos / 2

# Aplicar el logaritmo natural al peso (para análisis biológico)
log(pesos)

# Redondear el peso de los peces
round(pesos)

# ----- Ejercicio -----

# Agregar un nuevo pez capturado de 4.6 kg
pesos <- c(pesos, 4.6)

# ¿Cuántos peces pesan más de 5 kg?
sum(pesos > 5)

# ¿El pez más pesado pesa más de 10 kg?
any(pesos > 10)

# Calcular el peso total y promedio después de agregar el nuevo pez
suma_total <- sum(pesos)
promedio_total <- mean(pesos)
suma_total
promedio_total
