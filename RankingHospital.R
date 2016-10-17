rankhospital <- function(estado, resultado, num="mejor") {
   
    if (!resultado %in% c("ataque", "falla cardiaca", "neumonia")) {
        stop("Resultado inv??lido")
    }
    
    colu <- ifelse(resultado == "ataque", 11, ifelse(resultado == "falla cardiaca", 17, 23))
    
    data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
    data[,colu] <- suppressWarnings(as.numeric(data[,colu]))
    data <- na.omit(data)
    
    estados <- table(data$State)
    if (!estado %in% names(estados)) { 
        stop("Estado inv??lido")
    }
    
    seccion <- subset(data, State==estado)
    seccion <- seccion[order(seccion[,colu], seccion[,2], na.last=TRUE),2]
    seccion <- na.omit(seccion)
    
    num <- ifelse(num == "best", 1, ifelse(num == "peor", length(seccion), as.numeric(num)))
    
    seccion[num]
}