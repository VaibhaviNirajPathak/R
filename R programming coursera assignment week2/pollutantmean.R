pollutantmean <- function(directory,pollutant,id=1:332){
  path <- "/home/Ruser3/shiny_app"
  fullpath <- paste0(path,"/",directory)
  fileList = list.files(fullpath)
  #file.names = as.numeric(sub("\\.csv$","",fileList))
  #print(file.names)
  #selected_files <- fileList[match(id,file.names)]
  selected_files <- fileList[id]
  #print(selected_files)
  Data = lapply(file.path(fullpath,selected_files),read.csv)
  Data = do.call(rbind.data.frame,Data)
  mean(Data[,pollutant],na.rm=TRUE)
}

