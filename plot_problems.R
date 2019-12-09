library(tidyverse)
rm(list=ls())
sidc<-read_delim("http://sidc.be/silso/DATA/SN_d_tot_V2.0.csv",delim = ';',col_names=FALSE)

colnames(sidc) <- c("Year","Month","Day", "Fdate","Spots", "Sd","Obs" ,"Defin"  )
sidc$Ymd <- as.Date(paste(sidc$Year, sidc$Month, sidc$Day, sep = "-"))
sidc$Spots <- as.numeric(sidc$Spots)
sidc<- sidc %>% filter(Year>=1850)
##

#
## Plot using complete data.frame: 1850 - 2019
#
ggplot(data=sidc,aes(x=Ymd,y=Spots)) + geom_col() + 
  ggtitle("Plot without filter statment")
#
## Plot columns print hoizontal with filter statement:
#
A <- sidc %>% filter(Spots >=21 & Spots <=130)
ggplot(data=A) + geom_col(aes(x=Ymd,y=Spots)) + 
  ggtitle("Plot with filter statement") 


