#--------------------------------------------------------------------------------------------------------------
# Practica 2_1: Matrices, factores y dataframes
#--------------------------------------------------------------------------------------------------------------
# Parte 1: Trabajo con Matrices
# Datos:
hke <- c(25, 30)
jax <- c(18, 22)
sol <- c(12, 15)

capturas <- c(hke, jax, sol)
capturas

## 1.1. Crear una matriz de pesca
# Forma 1: Usando c()
pesca_matrix_c <- matrix(c(hke, jax, sol), nrow = 3, byrow = TRUE)
pesca_matrix_c

# Forma 2: Usando la función matrix() directamente --> RECOMENDABLE
pesca_matrix_cap <- matrix(capturas, nrow = 3, byrow = TRUE)
pesca_matrix_cap

# Nombra las filas con los nombres de las especies y las columna como "Norte" y "Sur"
rownames(pesca_matrix_cap) <- c("hke", "jax", "sol")
colnames(pesca_matrix_cap) <- c("Norte", "Sur")
pesca_matrix_cap

## 1.2. Cálculo de totales
# Calcula el total de capturas por especie (rowSums)
totales_especie <- rowSums(pesca_matrix_cap)
totales_especie

# Añade este total como una neuva columna en 'pesca_matrix'
pesca_completa <- cbind(pesca_matrix_cap, Total = totales_especie)
pesca_completa

## 1.3. Nueva jornada de pesca
# Datos:
hke <- c(28, 32)
jax <- c(20, 25)
sol <- c(13, 18)
capturas <- c(hke, jax, sol)

pesca_j2 <- matrix(capturas, nrow = 3, byrow = TRUE)
rownames(pesca_j2) <- c("hke", "jax", "sol")

# Une las dos matrices (pesca_matrix_cap y pesca_j2) en una sola
pesca_total <- rbind(pesca_matrix_cap, pesca_j2)

# Calcula las capturas totales por región (colSums)
totales_region <- colSums(pesca_total)
pesca_completa_rg <- rbind(pesca_total, Total_region = totales_region)
pesca_completa_rg

# Calcula las capturas totales por especie (rowSums)
totales_spp <- rowSums(pesca_completa_rg)
pesca_completa_rg_sp <- cbind(pesca_completa_rg, Total_spp = totales_spp)
pesca_completa_rg_sp

## 1.4. Estimación de ingresos: Cada especie tiene el siguiente precio por region
# Datos:
hke_precio <- c(10, 12)
jax_precio <- c(8, 9)
sol_precio <- c(14, 15)
precios_sp <- c(hke_precio, jax_precio, sol_precio)

# Crea una matrix de precios llamada 'precios'
precios <- matrix(precios_sp, 
                  nrow = 3, 
                  byrow = TRUE,
                  dimnames = list(c("hke", "jax", "sol"), # Nombrar filas
                                  c("Norte", "Sur")))     # Nombrar columnas
precios

# Calcula la matrix de ingresos de la primera jornada (pesca_matrix_cap) y guardala como ingresos_j1
ingresos_j1 <- pesca_matrix_cap * precios
ingresos_j1

# Calcula el ingreso medio en la region norte
ingreso_medio_norte <- mean(ingresos_j1[, "Norte"])
ingreso_medio_norte

#--------------------------------------------------------------------------------------------------------------
# Parte 2: Factores en técnica de pesca
#--------------------------------------------------------------------------------------------------------------
## 2.1. Factores nominales
# Datos:
artes <- c("arrastre", "cerco", "cerco", "volanta", "enmalle")
artes

# Convierte artes en un factor nominal llamado 'factor_artes'
factor_artes <- factor(artes)
factor_artes

# Compara los elementos del vector
artes[1] < artes[2]

# Compara los niveles de los factores
factor_artes[1] < factor_artes[2]

# Usa 'summary()' para ver el conteno de cada tipo de red
summary(factor_artes)

## 2.2. Factores ordinales - Efciciencia de pesca

# Datos:
eficiencia <- c("media", "baja", "baja", "media", "alta")
eficiencia

# Convierte eficiencia en un factor ordinal llamado 'factor_eficiencia'
factor_eficiencia <- factor(eficiencia, 
                             levels = c("baja", "media", "alta"), 
                             ordered = TRUE)
factor_eficiencia

# Compara los elementos del vector del pescador 2 con el pescador 5 usando operadores logicos
# ¿Es el pescador 2 más eficiente que el pescador 5?
factor_eficiencia[2] > factor_eficiencia[5]

#--------------------------------------------------------------------------------------------------------------
# Parte 3: Análisis de datos con dataframes
#--------------------------------------------------------------------------------------------------------------
## 3.1. Creación de un dataframe
# Datos:
marea <- c("Hoja 1", "Hoja 2", "Hoja 3", "Hoja 4", "Hoja 5")
barco <- c("Barco A", "Barco B", "Barco C", "Barco D", "Barco E")
arte <- c("arrastre", "cerco", "palangre", "arrastre", "cerco")
kg_land <- c(1500, 2200, 1100, 1800, 2500)
zona_fao <- c("27.8.b", "27.9.a", "27.10.a", "27.8.b", "27.9.a")
inspeccion <- c(TRUE, FALSE, TRUE, FALSE, TRUE)

# Combinarlos en un dataframe llamado 'mareas_df
mareas_df <- data.frame(
  marea = marea,
  barco = barco,
  arte = arte,  
  kg_land = kg_land,
  zona_fao = zona_fao,
  inspeccion = inspeccion
)

# Muestra el dataframe
View(mareas_df)

# Muestra la estructura del dataframe
str(mareas_df)
summary(mareas_df)

## 3.2. Filtrado de datos
# Filtra solo las mareas inspeccionadas
mareas_inspeccionadas <- mareas_df[mareas_df$inspeccion == TRUE, ] # Con el simbolo del $ accedemos a las columnas del dataframe
mareas_inspeccionadas

# Calcula el promedio de kg desembarcados en esas mareas
promedio_kg_barco_a <- mean(mareas_inspeccionadas$kg_land)
promedio_kg_barco_a

# ¿Qué arte de pesca se usó más en mareas inspeccionadas?
arte_mas_usado <- mareas_inspeccionadas$arte[which.max(table(mareas_inspeccionadas$arte))]
arte_mas_usado
