# Cargar los paquetes necesarios
library(dplyr)

# Funcion para leer y modificar los datos agregando un ID por cada tabla
readAllData <- function(tableName) {
  datos <- read_csv(tableName)
  datos <- datos %>% mutate(Origen = tableName)
  return(datos)
}

#Listar todas las tablas disponibles
tablas <- list.files(pattern = '.csv$', recursive = T)

# Leer todos los datos como una tabla
datos <- tablas %>% lapply(readAllData) %>% rbind

#########
# Escalamiento de datos
datos <- scale(datos, scale = F)

# NN
set.seed(50)
# Seleccionar el 70% de la poblacion
index <- sample(1:nrow(datos),round(0.70*nrow(datos)))

datos_all <- Abs_mc %>% as.data.frame 
datos_all$Ejercicios <- Abs_final$Laboratories %>% as.factor

# Train data
datos_train$Ejercicios <- datos[index] %>%
  as.factor
names(datos_train) <- c(paste0('Ejercicios', 
                             names(datos)[-ncol(datos)],
                             '_nm'),
                      'Rutina')
# Test data
datos_test <- datos[-index,] %>% as.data.frame
datos_test$Ejercicios <- datos_final$Ejercicios[-index] %>%
  as.factor 
names(datos_test) <- c(paste0('Ejercicios',
                            names(abs_test)[-ncol(abs_test)],
                            '_nm'),
                     'Rutina')

## VSM
# Cost 30 optimum
datos_svm <- svm(as.formula('Ejercicios~.'), data = abs_train,
               kernel = 'linear', cost = 30, scale =F)

summary(datos_svm)
datos_pred <- predict(datos_svm, datos_test[, -ncol(datos_test) ])

confusionMatrix(datos_pred, datos_test$Ejercicios)
