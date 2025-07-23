# Cargar paquetes necesarios
Packages = c("tidyverse", "readxl")
lapply(Packages, library, character.only = TRUE)

# Leer los datos desde el Excel
datos <- read_excel("DatosPesca.xlsx", sheet = "Datos")

# 1. filter(): filtrar solo capturas del año 2024 y tipo DEMERSALES
datos_filtrados <- datos %>%
  filter(AÑO_CAPTURA == 2024, TIPO == "DEMERSALES")

# 2. select(): seleccionar solo algunas columnas de interés
datos_seleccionados <- datos_filtrados %>%
  select(CFR, FechaCaptura, CodigoArte, Especie, PesoDesembarcadoVivo)

# 3. mutate(): crear nueva variable con peso en toneladas
datos_con_toneladas <- datos_seleccionados %>%
  mutate(PesoToneladas = as.numeric(PesoDesembarcadoVivo) / 1000)

# 4. arrange(): ordenar por peso descendente
datos_ordenados <- datos_con_toneladas %>%
  arrange(desc(PesoToneladas))

# 5. group_by() + summarise(): peso total por especie
peso_por_especie <- datos_filtrados %>%
  group_by(Especie) %>%
  summarise(PesoTotal = sum(as.numeric(PesoDesembarcadoVivo), na.rm = TRUE))

# 6. distinct(): obtener combinaciones únicas de especie y arte
especie_arte <- datos %>%
  distinct(Especie, CodigoArte)

# 7. rename(): cambiar nombre de columna
datos_renombrados <- datos %>%
  rename(Arte = CodigoArte, Peso = PesoDesembarcadoVivo)

# 8. count(): contar número de capturas por especie
conteo_especies <- datos %>%
  count(Especie, sort = TRUE)

# 9. case_when(): clasificar el peso en categorías
datos_categorizados <- datos %>%
  mutate(
    PesoCategoria = case_when(
      as.numeric(PesoDesembarcadoVivo) < 100 ~ "Bajo",
      as.numeric(PesoDesembarcadoVivo) < 500 ~ "Medio",
      TRUE ~ "Alto"
    )
  )