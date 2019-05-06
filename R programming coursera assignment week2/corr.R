corr <- function(directory,threshold=0){
  path <- "/home/Ruser3/shiny_app"
  fullpath <- paste0(path,"/",directory)
  #print(fullpath)
  fileList = list.files(fullpath)
  id=1:332
  cor_vec <- NULL
  for(i in id){
  file <- read.csv(fileList[i],header = TRUE)
  tp <- file[complete.cases(file),]
   if(nrow(tp) > threshold){
   cor_vec<-c(cor_vec,cor(tp[,"sulfate"],tp[,"nitrate"]))
   }
  }
  return(cor_vec)
}
