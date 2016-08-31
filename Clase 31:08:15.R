#Factores
x <- factor(c("si","no","si","si","no","si","no"),levels = c("si", "no"))
x
table(x)
x<-factor(c("azul", "azul", "rojo", "azul", "amarillo"))
x
x<-c(1,2,NaN,10,3)
is.na(x)
is.nan(x)
#Data Frames
x<-data.frame( Erick = 1:4 , Lori = c(T, T, F, F))
row.names(x)<- c("primero", "segundo", "tercero", "cuarto")
x
nrow(x)
ncol(x)
attributes(x)
names(x)<-c("Yarely", "Karen")
x

#Los nombres nos exclusivos de data frames
x<-1:3
names(x) #null
names(x)<- c("Hugo","Paco","Luis")
x


#Lectura de datos
getwd()
setwd("~/Documents/Programacion_Actuarial_III_OT16")
data<-read.csv("Datos S&P.csv")
data

x<- list(a=1:10, b=100:91, c=51:60)
x
names(x)<-c("Seq1", "Seq2", "Seq3")
x

m<- matrix(1:4, 2,2)
m
attributes(m)
dimnames(m)<- list(c("fil1", "fil2"),c("col1", "col2"))
m
m<-matrix(nrow=5,ncol = 6)
dimnames(m)<-list(c(1:5),c("A","B","C","D","E","F"))
m
#Lectura de datos
getwd()
setwd("~/Documents/Programacion_Actuarial_III_OT16")
data<-read.csv("Data S&P .csv")
data<-read.table("Data S&P .csv",F,",")
data
