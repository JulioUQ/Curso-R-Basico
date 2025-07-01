Aquí tienes una versión ampliada del script original con nuevos apartados sobre **manipulación de datos** en R, manteniendo un enfoque didáctico y coherente con los contenidos previos del curso:
  
  ---
  
  ```r
# DATA FRAMES: Permiten combinar variables de diferentes tipos (numéricas, lógicas, texto...)

# Creamos vectores con los datos de 6 mareas
barco <- c("Atún I", "Mar Azul", "Pesca Norte", "Océano V", "Costa Libre", "Delta Sur")
arte <- c("Palangre", "Arrastre", "Cerco", "Arrastre", "Palangre", "Cerco")
kg_desembarcados <- c(1200, 3400, 1500, 2200, 900, 1800)
zona_fao <- c("27.8.c", "27.8.c", "27.9.a", "27.9.a", "27.10.a", "27.10.a")
inspeccion <- c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE)

# Creamos el data frame
mareas_df <- data.frame(barco, arte, kg_desembarcados, zona_fao, inspeccion)

# Inspeccionamos la estructura
str(mareas_df)

# Vemos los primeros registros
head(mareas_df)

# Accedemos al dato: kg desembarcados en la marea 1
mareas_df[1, "kg_desembarcados"]

# Filtramos solo las mareas con inspección
mareas_df[mareas_df$inspeccion == TRUE, ]

# Ordenamos por kg desembarcados (de menor a mayor)
mareas_df[order(mareas_df$kg_desembarcados), ]

# Seleccionamos solo la columna zona FAO con el signo $
mareas_df$zona_fao

#  Añadir una nueva variable
precio_kg <- 5
mareas_df$ingresos_estimados <- mareas_df$kg_desembarcados * precio_kg

# Agrupar por tipo de arte y sumar totales
  
aggregate(kg_desembarcados ~ arte, data = mareas_df, sum)

# Renombrar columnas
colnames(mareas_df) <- c("Barco", "ArtePesca", "Kilos", "ZonaFAO", "Inspeccion", "Ingresos")

# Filtrar múltiples condiciones
subset(mareas_df, Inspeccion == TRUE & Kilos > 2000)

# Reordenar columnas
mareas_df <- mareas_df[, c("Barco", "ArtePesca", "Kilos", "Ingresos", "ZonaFAO", "Inspeccion")]
  
# Calcular proporción respecto al total
total_kg <- sum(mareas_df$Kilos)
mareas_df$Proporcion <- round(mareas_df$Kilos / total_kg * 100, 2)

#️ Convertir columnas a factor
mareas_df$ArtePesca <- as.factor(mareas_df$ArtePesca)
mareas_df$ZonaFAO <- as.factor(mareas_df$ZonaFAO)