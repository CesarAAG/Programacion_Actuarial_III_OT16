if (!("reshape2" %in% rownames(installed.packages())) ) {
    print("Please install required package \"reshape2\" before proceeding")
} else {
    ## Abre librerias requeridas 
    library(reshape2)
    
    ## Se leen los archivos necesarios
    
    ## Lee todas las etiquetas y sus nommbra, para ordenarlas en columnas apropiadas
    activity_labels <- read.table("./activity_labels.txt",col.names=c("activity_id","activity_name"))
    
    ## Lee todos los identifadores de las columnas del data frame
    features <- read.table("features.txt")
    feature_names <-  features[,2]
    testdata <- read.table("./test/X_test.txt")
    colnames(testdata) <- feature_names
    traindata <- read.table("./train/X_train.txt")
    colnames(traindata) <- feature_names
    test_subject_id <- read.table("./test/subject_test.txt")
    colnames(test_subject_id) <- "subject_id"
    
  
    test_activity_id <- read.table("./test/y_test.txt")
    colnames(test_activity_id) <- "activity_id"
    
    
    train_subject_id <- read.table("./train/subject_train.txt")
    colnames(train_subject_id) <- "subject_id"
    

    train_activity_id <- read.table("./train/y_train.txt")
    colnames(train_activity_id) <- "activity_id"
    
    ##Combina subject id's, the test activity id's 
    ##y testdata en  un un dataframe
    test_data <- cbind(test_subject_id , test_activity_id , testdata)
    
    ##Combina subject id's, the test activity id's 
    ##y  testdata en  un un dataframe
    train_data <- cbind(train_subject_id , train_activity_id , traindata)
    
    ##Combina la test data y la train data en un dataframe
    all_data <- rbind(train_data,test_data)
    
    ##Extrae ??nicamente las medidas de media y desviaci??n est??ndar de cada medici??n.
    mean_col_idx <- grep("mean",names(all_data),ignore.case=TRUE)
    mean_col_names <- names(all_data)[mean_col_idx]
    std_col_idx <- grep("std",names(all_data),ignore.case=TRUE)
    std_col_names <- names(all_data)[std_col_idx]
    meanstddata <-all_data[,c("subject_id","activity_id",mean_col_names,std_col_names)]
    
    ##Usa nombres de actividad para describir los nombres de las actividades en la base de datos.
    
    descrnames <- merge(activity_labels,meanstddata,by.x="activity_id",by.y="activity_id",all=TRUE)
    
    ##Coloca etiquetas apropiadas en la base de datos con nombres de variables que las describan.
   
    data_melt <- melt(descrnames,id=c("activity_id","activity_name","subject_id"))
    
   # Crea una segunda base de datos independiente con el promedio de cada variable para cada actividad y cada sujeto.
    mean_data <- dcast(data_melt,activity_id + activity_name + subject_id ~ variable,mean)
    write.table(mean_data,"./tidy_movement_data.txt")
    
}