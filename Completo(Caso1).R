setwd("~/Documents/specdata") #Depende de en donde se encuentre el directorio

completo<-function(directorio, id=1:332){
  directorio <- list.files(path=getwd())
  nobs<-numeric()
  for (y in id) {
  hola <-read.csv(directorio[y], header = T)
  nobs <-c(nobs, sum(complete.cases(hola))) 
  }
  data.frame(id, nobs)
}

completo("specdata",1:8)

