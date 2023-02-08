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
vol.iss.all <- paste( data.all[,1], as.character(data.all[,2]), sep = "-" )

###=== extracting focal papers ===###
list.temp <- list.crsp.non.native.w ### <<<=== input your list!!! <<<=== ###
vol.iss <- paste( list.temp[,1], as.character(list.temp[,2]), sep = "-" )
vol.iss <- vol.iss[!duplicated(vol.iss)]

############################
###=== correspondance ===###
############################
nation.crsp <- c(); nation.non.crsp <- c()

for ( i in 1:length(vol.iss) ) {
  
  num <- length( which(vol.iss.all==vol.iss[i]) )
  data.part <- data.all[which(vol.iss.all==vol.iss[i]),]
  if( ncol( data.part ) == 1 ){
    data.part <- t( data.part )
  }

  ###--- corresponding authors ---###
  data.crsp <- data.part[ which( data.part$correspondance == 1 ), ]
  nation.crsp <- c( nation.crsp, data.crsp$nation_1 )
  ###--- non-corresponding authors ---###
  data.non.crsp <- data.part[ which( data.part$correspondance == 0 ), ]
  nation.non.crsp <- c( nation.non.crsp, data.non.crsp$nation_1 )
  
  #print(i)
}

###--- view a list of corresponding authors ---###
if( !is.null(nation.crsp) ){
  
  # nation list
  nation.crsp.ranking <- table( nation.crsp )
  nation.crsp.ranking <- data.frame( rbind(nation.crsp.ranking) )
  nation.crsp.ranking <- t(nation.crsp.ranking)
  colnames( nation.crsp.ranking ) <- c("ranking")
  nation.crsp.ranking <- data.frame(
    cbind(
      rownames( nation.crsp.ranking ),
      matrix( nation.crsp.ranking )
    )
  )
  colnames( nation.crsp.ranking ) <- c("correspo", "abundance")
  nation.crsp.ranking <- nation.crsp.ranking[order( as.integer(nation.crsp.ranking$abundance), decreasing=TRUE ),]
  rownames( nation.crsp.ranking ) <- 1:length( nation.crsp.ranking[,1] )
}
View(nation.crsp.ranking)

###--- view a list of corresponding authors ---###
if( !is.null( nation.non.crsp ) ){
  
  # nation list
  nation.non.crsp.ranking <- table( nation.non.crsp )
  nation.non.crsp.ranking <- data.frame( rbind(nation.non.crsp.ranking) )
  nation.non.crsp.ranking <- t(nation.non.crsp.ranking)
  colnames( nation.non.crsp.ranking ) <- c("ranking")
  nation.non.crsp.ranking <- data.frame(
    cbind(
      rownames( nation.non.crsp.ranking ),
      matrix( nation.non.crsp.ranking )
    )
  )
  colnames( nation.non.crsp.ranking ) <- c("non-correspo", "abundance")
  nation.non.crsp.ranking <- nation.non.crsp.ranking[order( as.integer(nation.non.crsp.ranking$abundance), decreasing=TRUE ),]
  rownames( nation.non.crsp.ranking ) <- 1:length( nation.non.crsp.ranking[,1] )
}
View(nation.non.crsp.ranking)
