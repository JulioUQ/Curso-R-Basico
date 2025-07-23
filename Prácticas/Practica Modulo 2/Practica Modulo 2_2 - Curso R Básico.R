# Practica Modulo 2_2 - Curso R Básico

#--------------ESPACIO DE TRABAJO Y RUTAS RELATIVAS---------------#
# Modificar por el path del directorio de trabajo 
home_path  = "~/Documents/GitHub/Curso-R-Basico"
data_loc   = paste0(home_path,"/Prácticas/Practica Modulo 2/")
file_path_csv = paste0(data_loc, "PescaPacifico_Palangre_2005-13.csv")
file_path_xlsx = paste0(data_loc, "PescaPacifico_Palangre_2005-13.xlsx")

# 1. Preparación del conjunto de datos
## 1.1 Cargar el archivo de datos
help("read.csv")

# Cargar el archivo CSV
df_csv = read.csv(file_path_csv, sep = ';', dec = ',')
df_csv

# Cargar el archivo XLSX
library(readxl)
df_xlsx <- read_excel(file_path_xlsx)

# Revision de la estructura con str()
str(df_csv)

# Conversion de columnas de fecha a Date
df_csv$FechaSalida      <- as.Date(df_csv$FechaSalida, format = "%d/%m/%Y")
df_csv$FechaRegreso     <- as.Date(df_csv$FechaRegreso, format = "%d/%m/%Y")
df_csv$FechaDesembarque <- as.Date(df_csv$FechaDesembarque, format = "%d/%m/%Y")
df_csv$FechaCaptura     <- as.Date(df_csv$FechaCaptura, format = "%d/%m/%Y")

## 1.2 Identificación de duplicados
duplicated_rows <- duplicated(df_csv)
sum(duplicated_rows)

# Visualizar los duplicados
df_csv[duplicated_rows, ]

# Eliminamos duplicados
df_csv_2 <- df_csv[!duplicated(df_csv), ]

## 1.3. Identificar valores vacíos o nulos
# Detecta las columnas con valores vacíos o nulos en cada una de las columnas.
colSums(is.na(df_csv_2) | df_csv_2 == "" | df_csv_2 == 0)

# Elimina las columnas con más de 50 % de valores nulos o vacíos.
# Solo contar NA, "", o 0 de forma segura
porcentaje_nulos <- colMeans(
     is.na(df_csv_2) |
    (df_csv_2 == "" & sapply(df_csv_2, is.character)[col(df_csv_2)]) |
    (df_csv_2 == 0 & sapply(df_csv_2, is.numeric)[col(df_csv_2)])
)

porcentaje_nulos

# Eliminar columnas con más del 50% de valores nulos, vacíos o ceros
df_csv_3 <- df_csv_2[, porcentaje_nulos <= 0.5]

## 1.4. Renombrar columnas para simplificar

# Pasamos todo a minúscula
names(df_csv_3) <- tolower(names(df_csv_3))
df_csv_3

# Eliminamos caracteres especiales
names(df_csv_3) <- c(
   "ano", "hojamarea", "idbuque",  "cfr", "buque",  "al3",     
   "especie", "peso", "zona", "fcsalida", "fcregreso", "fcdesembarque",  
   "fccaptura", "puertodesembarque"
)

names(df_csv_3)



