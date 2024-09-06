library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- "mice_pheno.csv"
download(url,destfile=filename)
filename <- "/home/maria/Documents/DataScienceR/mice_pheno.csv"
dat <- read.csv(filename)
dat
