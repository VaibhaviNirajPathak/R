#############################################################################################################################
# Author : Vaibhavi Pathak
# Purpose : create Taxonomy_assignments excel file for Qiime2 taxa output(Qiime2 created level-*.csv files are used as input)
# Usage : Rscript taxonomy_assignenments.R
# Date : 13/02/2020
#############################################################################################################################

library(ggplot2)
library(xlsx)
library(stringr)
filelist = list.files(pattern = ".*.csv")
#exclude <- paste("level","1",sep = "-")
new_filelist <- filelist[str_detect(filelist,"level-1", negate = TRUE) ]
taxa_class<-c("phylum","class","order","family","genus","species")

for (i in 1:length(new_filelist)){
filename = unlist(strsplit(new_filelist[i],".csv"))
print(filename)
taxa<- read.table(new_filelist[i], sep=",", quote="", stringsAsFactors=FALSE,header=TRUE)
t_taxa <- t(taxa)
n<-dim(t_taxa)[1]
print(n)
t_taxa<-t_taxa[1:(n-3),]
write.xlsx(t_taxa, "Taxonomy_distribution.xlsx", col.names=FALSE, row.names=TRUE, sheetName=taxa_class[i], append=TRUE )
}
