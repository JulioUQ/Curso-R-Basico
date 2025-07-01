# FACTORES: Se usan para representar variables categóricas

# Supongamos que registramos el arte de pesca utilizado en 6 mareas
arte_pesca <- c("Arrastre", "Palangre", "Cerco", "Arrastre", "Cerco", "Palangre")

# Convertimos a factor
arte_factor <- factor(arte_pesca)

# Mostramos el factor
print(arte_factor)

# Verificamos los niveles únicos (categorías posibles)
levels(arte_factor)

# ¿Cuántas veces se utilizó cada arte?
summary(arte_factor)

# También podemos ordenar los factores si hay un orden lógico (por ejemplo, tamaño)
talla <- factor(c("Pequeño", "Mediano", "Grande", "Mediano"), levels = c("Pequeño", "Mediano", "Grande"), ordered = TRUE)
print(talla)
