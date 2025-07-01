# MATRICES: Son estructuras bidimensionales con elementos del mismo tipo (generalmente numérico)

# Imaginemos que queremos registrar las capturas (en kg) por especie durante tres días

# Creamos la matriz
capturas <- matrix(
  c(120, 150, 180,   # Dorada
    90, 110, 130,    # Merluza
    45, 55, 60),     # Pulpo
  nrow = 3, byrow = TRUE
)

# Asignamos nombres a las filas y columnas
rownames(capturas) <- c("Dorada", "Merluza", "Pulpo")
colnames(capturas) <- c("Día 1", "Día 2", "Día 3")

# Imprimimos la matriz
print(capturas)

# Acceder al valor de capturas de merluza en el día 2
capturas["Merluza", "Día 2"]

# Sumar todas las capturas del día 1
sum(capturas[, "Día 1"])
