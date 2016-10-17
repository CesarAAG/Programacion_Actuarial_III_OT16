rankingcompleto <- function(resultado, num="mejor"){
if (!resultado %in% c("ataque", "falla cardiaca", "neumonia")) {
    stop("Resultado inv??lido")
}

colu <- ifelse(resultado == "ataque", 11, ifelse(resultado == "falla cardiaca", 17, 23))

data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
data[,colu] <- suppressWarnings(as.numeric(data[,colu]))
data <- data[!is.na(data[,colu]),]

orden <- data[order(data[,colu], data[,2], na.last=TRUE),]
orden <- orden[!is.na(orden[,colu]),]


num <- ifelse(num == "mejor", 1, ifelse(num == "peor", length(orden), as.numeric(num)))


estados <- sort(unique(orden[,7]))


datoshs <- function(estados) {
    seccion <- subset(orden, State==estados)
    seccion <- seccion[num, c(2,7,colu)]
    seccion$State <- estados
    return (seccion)
   
}
datoses <- lapply(estados, datoshs)
dframe <- as.data.frame(do.call(rbind, lapply(estados, datoshs)), row.names= estados)
colnames(dframe) <- c("hospital", "estados", "morta")
return (dframe)
}