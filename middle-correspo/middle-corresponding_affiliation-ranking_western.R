###--- setting working directory ---###
journal.dir <- "ecology"
wd.name <- paste( paste("~/web_scraping",journal.dir,sep="/"), "result2023_with_nation-1", sep="/" )
setwd( wd.name )

###--- csv list ---###
csv_list <- list.files( pattern = "*.csv" )
len.csv.list <- length( csv_list )

#install.packages("openxlsx")
library("openxlsx")

#########################################################
###--- Non-corresponding author ranking in Western ---###
#########################################################
##-- All the non-correspoding authors from Western --##
if( !is.null(list.non.corresponding.author.w.all) ){
  
  # nation list
  list.non.corresponding.author.w.all.ranking <- table( list.non.corresponding.author.w.all[,8] )
  list.non.corresponding.author.w.all.ranking <- data.frame( rbind(list.non.corresponding.author.w.all.ranking) )
  list.non.corresponding.author.w.all.ranking <- t(list.non.corresponding.author.w.all.ranking)
  colnames( list.non.corresponding.author.w.all.ranking ) <- c("ranking")
  list.non.corresponding.author.w.all.ranking <- data.frame(
    cbind(
      rownames( list.non.corresponding.author.w.all.ranking ),
      matrix( list.non.corresponding.author.w.all.ranking )
    )
  )
  colnames( list.non.corresponding.author.w.all.ranking ) <- c("non-correspo", "abundance")
  list.non.corresponding.author.w.all.ranking <- list.non.corresponding.author.w.all.ranking[order( as.integer(list.non.corresponding.author.w.all.ranking$abundance), decreasing=TRUE ),]
  rownames( list.non.corresponding.author.w.all.ranking ) <- 1:length( list.non.corresponding.author.w.all.ranking[,1] )
}

##-- All the correspoding authors in papers including non-corresponding authors from Western --##
if( !is.null(list.corresponding.author.for.non.crsp.w) ){
  
  # nation list
  list.corresponding.author.for.non.crsp.w.ranking <- table( list.corresponding.author.for.non.crsp.w[,8] )
  list.corresponding.author.for.non.crsp.w.ranking <- data.frame( rbind(list.corresponding.author.for.non.crsp.w.ranking) )
  list.corresponding.author.for.non.crsp.w.ranking <- t(list.corresponding.author.for.non.crsp.w.ranking)
  colnames( list.corresponding.author.for.non.crsp.w.ranking ) <- c("ranking")
  list.corresponding.author.for.non.crsp.w.ranking <- data.frame(
    cbind(
      rownames( list.corresponding.author.for.non.crsp.w.ranking ),
      matrix( list.corresponding.author.for.non.crsp.w.ranking )
    )
  )
  colnames( list.corresponding.author.for.non.crsp.w.ranking ) <- c("correspo", "abundance")
  list.corresponding.author.for.non.crsp.w.ranking <- list.corresponding.author.for.non.crsp.w.ranking[order( as.integer(list.corresponding.author.for.non.crsp.w.ranking$abundance), decreasing=TRUE ),]
  rownames( list.corresponding.author.for.non.crsp.w.ranking ) <- 1:length( list.corresponding.author.for.non.crsp.w.ranking[,1] )
}


##-- Non-correspoding authors [Non-native (Correspo) vs Native (Non-correspo)] --##
if( !is.null(list.non.corresponding.author.w.all) ){
  
  nats <- c()
  
  for ( i in 1:len.csv.list ) {
    
    dat <- read.csv( csv_list[i] )
    
    len.crsps <- length( which( list.non.corresponding.author.w.all[,1] == csv_list[i] ) )
    crsps <- list.non.corresponding.author.w.all[which( list.non.corresponding.author.w.all[,1] == csv_list[i] ),]
    if( len.crsps == 1 ){ crsps <- t(crsps) }
    ids <- crsps[,2]
    
    for ( id.num in ids ) {
      temp <- c( which(dat[,1] == id.num), which(dat$correspondance == 1) )
      non.crsps <- dat[ temp[duplicated(temp)], ]
      temp.list <- rbind( non.crsps[which(non.crsps$area_1=="East Asia"),], 
                          non.crsps[which(non.crsps$area_1=="Africa"),],
                          non.crsps[which(non.crsps$area_1=="South America"),]
                          )
      nats <- c( nats, temp.list$nation_1 )
    }
  }
  
  # nation list
  list.crsp.non.native.w.ranking <- table( nats )
  list.crsp.non.native.w.ranking <- data.frame( rbind(list.crsp.non.native.w.ranking) )
  list.crsp.non.native.w.ranking <- t(list.crsp.non.native.w.ranking)
  colnames( list.crsp.non.native.w.ranking ) <- c("ranking")
  list.crsp.non.native.w.ranking <- data.frame(
    cbind(
      rownames( list.crsp.non.native.w.ranking ),
      matrix( list.crsp.non.native.w.ranking )
    )
  )
  colnames( list.crsp.non.native.w.ranking ) <- c("non-correspo", "abundance")
  list.crsp.non.native.w.ranking <- list.crsp.non.native.w.ranking[order( as.integer(list.crsp.non.native.w.ranking$abundance), decreasing=TRUE ),]
  rownames( list.crsp.non.native.w.ranking ) <- 1:length( list.crsp.non.native.w.ranking[,1] )
  
}
##-- Correspoding authors [Non-native (Correspo) vs Native (Non-correspo)] --##
if( !is.null(list.crsp.non.native.w) ){
  
  # nation list
  list.crsp.non.native.w.ranking <- table( list.crsp.non.native.w[,8] )
  list.crsp.non.native.w.ranking <- data.frame( rbind(list.crsp.non.native.w.ranking) )
  list.crsp.non.native.w.ranking <- t(list.crsp.non.native.w.ranking)
  colnames( list.crsp.non.native.w.ranking ) <- c("ranking")
  list.crsp.non.native.w.ranking <- data.frame(
    cbind(
      rownames( list.crsp.non.native.w.ranking ),
      matrix( list.crsp.non.native.w.ranking )
    )
  )
  colnames( list.crsp.non.native.w.ranking ) <- c("correspo", "abundance")
  list.crsp.non.native.w.ranking <- list.crsp.non.native.w.ranking[order( as.integer(list.crsp.non.native.w.ranking$abundance), decreasing=TRUE ),]
  rownames( list.crsp.non.native.w.ranking ) <- 1:length( list.crsp.non.native.w.ranking[,1] )
}

##-- Non-correspoding authors [Native (Correspo) vs Native (Non-correspo)] --##
if( !is.null(list.crsp.non.native.w) ){
  
  nats <- c()
  
  for ( i in 1:len.csv.list ) {
    
    dat <- read.csv( csv_list[i] )
    
    len.crsps <- length( which( list.crsp.non.native.w[,1] == csv_list[i] ) )
    crsps <- list.crsp.non.native.w[which( list.crsp.non.native.w[,1] == csv_list[i] ),]
    if( len.crsps == 1 ){ crsps <- t(crsps) }
    ids <- crsps[,2]
    
    for ( id.num in ids ) {
      temp <- c( which(dat[,1] == id.num), which(dat$correspondance == 0) )
      non.crsps <- dat[ temp[duplicated(temp)],]
      nats <- c( nats, non.crsps$nation_1 )
    }
  }
  
  # nation list
  list.non.crsp.non.native.w.ranking <- table( nats )
  list.non.crsp.non.native.w.ranking <- data.frame( rbind(list.non.crsp.non.native.w.ranking) )
  list.non.crsp.non.native.w.ranking <- t(list.non.crsp.non.native.w.ranking)
  colnames( list.non.crsp.non.native.w.ranking ) <- c("ranking")
  list.non.crsp.non.native.w.ranking <- data.frame(
    cbind(
      rownames( list.non.crsp.non.native.w.ranking ),
      matrix( list.non.crsp.non.native.w.ranking )
    )
  )
  colnames( list.non.crsp.non.native.w.ranking ) <- c("non-correspo", "abundance")
  list.non.crsp.non.native.w.ranking <- list.non.crsp.non.native.w.ranking[order( as.integer(list.non.crsp.non.native.w.ranking$abundance), decreasing=TRUE ),]
  rownames( list.non.crsp.non.native.w.ranking ) <- 1:length( list.non.crsp.non.native.w.ranking[,1] )
  
}

##-- Correspoding authors [Native (Correspo) vs Native (Non-correspo)] --##
if( !is.null(list.crsp.native.w) ){
  
  # nation list
  list.crsp.native.w.ranking <- table( list.crsp.native.w[,8] )
  list.crsp.native.w.ranking <- data.frame( rbind(list.crsp.native.w.ranking) )
  list.crsp.native.w.ranking <- t(list.crsp.native.w.ranking)
  colnames( list.crsp.native.w.ranking ) <- c("ranking")
  list.crsp.native.w.ranking <- data.frame(
    cbind(
      rownames( list.crsp.native.w.ranking ),
      matrix( list.crsp.native.w.ranking )
    )
  )
  colnames( list.crsp.native.w.ranking ) <- c("correspo", "abundance")
  list.crsp.native.w.ranking <- list.crsp.native.w.ranking[order( as.integer(list.crsp.native.w.ranking$abundance), decreasing=TRUE ),]
  rownames( list.crsp.native.w.ranking ) <- 1:length( list.crsp.native.w.ranking[,1] )
}

##-- Non-correspoding authors [Native (Correspo) vs Native (Non-correspo)] --##
if( !is.null(list.crsp.native.w) ){
  
  nats <- c()
  
  for ( i in 1:len.csv.list ) {
    
    dat <- read.csv( csv_list[i] )
    
    len.crsps <- length( which( list.crsp.native.w[,1] == csv_list[i] ) )
    crsps <- list.crsp.native.w[which( list.crsp.native.w[,1] == csv_list[i] ),]
    if( len.crsps == 1 ){ crsps <- t(crsps) }
    ids <- crsps[,2]
    
    for ( id.num in ids ) {
      temp <- c( which(dat[,1] == id.num), which(dat$correspondance == 0) )
      non.crsps <- dat[ temp[duplicated(temp)], ]
      nats <- c( nats, non.crsps$nation_1 )
    }
  }
  
  # nation list
  list.non.crsp.native.w.ranking <- table( nats )
  list.non.crsp.native.w.ranking <- data.frame( rbind(list.non.crsp.native.w.ranking) )
  list.non.crsp.native.w.ranking <- t(list.non.crsp.native.w.ranking)
  colnames( list.non.crsp.native.w.ranking ) <- c("ranking")
  list.non.crsp.native.w.ranking <- data.frame(
    cbind(
      rownames( list.non.crsp.native.w.ranking ),
      matrix( list.non.crsp.native.w.ranking )
    )
  )
  colnames( list.non.crsp.native.w.ranking ) <- c("non-correspo", "abundance")
  list.non.crsp.native.w.ranking <- list.non.crsp.native.w.ranking[order( as.integer(list.non.crsp.native.w.ranking$abundance), decreasing=TRUE ),]
  rownames( list.non.crsp.native.w.ranking ) <- 1:length( list.non.crsp.native.w.ranking[,1] )
  
}

#####################################################
###--- Corresponding author ranking in Western ---###
#####################################################
##-- All the correspoding authors from Western in papers not including authors from the other region --##
if( !is.null(list.corresponding.author.w) ){
  
  # nation list
  list.corresponding.author.w.ranking <- table( list.corresponding.author.w[,8] )
  list.corresponding.author.w.ranking <- data.frame( rbind(list.corresponding.author.w.ranking) )
  list.corresponding.author.w.ranking <- t(list.corresponding.author.w.ranking)
  colnames( list.corresponding.author.w.ranking ) <- c("ranking")
  list.corresponding.author.w.ranking <- data.frame(
    cbind(
      rownames( list.corresponding.author.w.ranking ),
      matrix( list.corresponding.author.w.ranking )
    )
  )
  colnames( list.corresponding.author.w.ranking ) <- c("correspo", "abundance")
  list.corresponding.author.w.ranking <- list.corresponding.author.w.ranking[order( as.integer(list.corresponding.author.w.ranking$abundance), decreasing=TRUE ),]
  rownames( list.corresponding.author.w.ranking ) <- 1:length( list.corresponding.author.w.ranking[,1] )
}

##-- non-corresponding author --##
if( !is.null(list.corresponding.author.w) ){
  
  nats <- c()
  
  for ( i in 1:len.csv.list ) {
    
    dat <- read.csv( csv_list[i] )
    
    len.crsps <- length( which( list.corresponding.author.w[,1] == csv_list[i] ) )
    crsps <- list.corresponding.author.w[which( list.corresponding.author.w[,1] == csv_list[i] ),]
    if( len.crsps == 1 ){ crsps <- t(crsps) }
    ids <- crsps[,2]
    
    for ( id.num in ids ) {
      temp <- c( which(dat[,1] == id.num), which(dat$correspondance == 0) )
      non.crsps <- dat[ temp[duplicated(temp)], ]
      nats <- c( nats, non.crsps$nation_1 )
    }
  }
  
  # nation list
  list.non.crsp.native.w.ranking <- table( nats )
  list.non.crsp.native.w.ranking <- data.frame( rbind(list.non.crsp.native.w.ranking) )
  list.non.crsp.native.w.ranking <- t(list.non.crsp.native.w.ranking)
  colnames( list.non.crsp.native.w.ranking ) <- c("ranking")
  list.non.crsp.native.w.ranking <- data.frame(
    cbind(
      rownames( list.non.crsp.native.w.ranking ),
      matrix( list.non.crsp.native.w.ranking )
    )
  )
  colnames( list.non.crsp.native.w.ranking ) <- c("non-correspo", "abundance")
  list.non.crsp.native.w.ranking <- list.non.crsp.native.w.ranking[order( as.integer(list.non.crsp.native.w.ranking$abundance), decreasing=TRUE ),]
  rownames( list.non.crsp.native.w.ranking ) <- 1:length( list.non.crsp.native.w.ranking[,1] )
  
}

##-- Correspoding authors [Western (Correspo) vs the others are Western (Non-correspo)] --##
if( !is.null(list.crsp.only.w) ){
  
  # nation list
  list.crsp.only.w.ranking <- table( list.crsp.only.w[,8] )
  list.crsp.only.w.ranking <- data.frame( rbind(list.crsp.only.w.ranking) )
  list.crsp.only.w.ranking <- t(list.crsp.only.w.ranking)
  colnames( list.crsp.only.w.ranking ) <- c("ranking")
  list.crsp.only.w.ranking <- data.frame(
    cbind(
      rownames( list.crsp.only.w.ranking ),
      matrix( list.crsp.only.w.ranking )
    )
  )
  colnames( list.crsp.only.w.ranking ) <- c("correspo", "abundance")
  list.crsp.only.w.ranking <- list.crsp.only.w.ranking[order( as.integer(list.crsp.only.w.ranking$abundance), decreasing=TRUE ),]
  rownames( list.crsp.only.w.ranking ) <- 1:length( list.crsp.only.w.ranking[,1] )
}
