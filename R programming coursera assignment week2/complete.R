complete <- function(directory, id=1:10){
  
  path <- "/home/Ruser3/shiny_app"
  fullpath <- paste0(path,"/",directory)
  #print(fullpath)
  fileList = list.files(fullpath)
  #selected_files <- fileList[id]
  #print(selected_files)
  new_df <- data.frame()
  for(i in id){
    tp<- read.csv(fileList[i],header=TRUE)
    nobs <- sum(complete.cases(tp))
    df <- data.frame(i,nobs)
    new_df <- rbind(new_df,df)
    }
  return(new_df)
  
}
