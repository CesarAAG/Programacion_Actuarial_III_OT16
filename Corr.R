setwd("~/Documents/specdata") #Depende de en donde se encuentre el directorio
Correlacion<-function(directorio, horizonte=0){
  directorio <- list.files(path=getwd())
  source("~/Documents/Programacion_Actuarial_III_OT16/Completo(Caso1).R") #Directorio en el que se 
  # encuentra el archivo
  o <- completo(directorio)
  inv <- o[o["nobs"] > horizonte, ]$id
  corre <- numeric()
  for (y in inv) {
    hola <-read.csv(directorio[y], header = T)
    com <- hola[complete.cases(hola), ]
    corre <- c(corre, cor(com$sulfate, com$nitrate))
  }
  corre
}
 Correlacion("specdata", 1)
 
