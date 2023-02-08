###########################
# making a network
###########################

###--- setting working directory ---###
journal.dir <- "ecology"
wd.name <- paste( paste("~/web_scraping",journal.dir,sep="/"), "result2023_with_nation-1", sep="/" )
setwd( wd.name )

###--- csv list ---###
csv_list <- list.files( pattern = "*.csv" )
len.csv.list <- length( csv_list )

#install.packages("openxlsx")
library("openxlsx")

###--- all data ---###
data.all <- c()
for ( i in 1:len.csv.list ) {
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  temp <- cbind(rep( csv_list[i], length=length(dat[,1]) ), dat)
  colnames( temp ) <- c( "volume_issue", "id", "title", "web_page", "author", "status", 
                         "correspondance", "affiliation_1", "affiliation_2", "keyword", 
                         "field", "category", "nation_1", "area_1", "nation_2", "area_2" 
  )
  data.all <- rbind( data.all, temp )
}

nation.all <- data.all$nation_1
nation.all <- nation.all[!duplicated(nation.all)]
