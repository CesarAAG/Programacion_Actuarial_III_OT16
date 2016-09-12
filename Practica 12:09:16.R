z <- 5
menor <- 0
mayor <- 0
  for(i in 1:100){
    caminata <- vector("numeric")
    while(z>=3 && z <=10) {
      print(z)
      caminata <- c(caminata, z)
      moneda <- rbinom(1, 1, 0.5)
        if(moneda==1){
        z <- z + 0.5
    }   else {
        z <- z-0.5
    } 
          if(z>3){menor <- menor + 1}
          else {mayor <- mayor + 1}
  }
}
menor
mayor