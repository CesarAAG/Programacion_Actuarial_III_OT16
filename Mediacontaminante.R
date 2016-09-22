setwd("~/Documents/specdata") #Depende de en donde se encuentre el directorio

mediac<-function(directorio, contaminante, id=1:332){
  data<-numeric()
  directorio <- list.files(path=getwd())
  for (y in id) {
    hola <-read.csv(directorio[y], header = T)
    data<-c(data,hola[[contaminante]])
  }
  mean(data, na.rm = T)
}  
mediac("specdata", "nitrate", 1 )
