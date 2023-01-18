#install.packages("openxlsx")
library("openxlsx")

#########################################################
###--- Non-corresponding author ranking in Western ---###
#########################################################
##-- All the non-correspoding authors from Western --##
if( !is.null(list.non.corresponding.author.sa.all) ){
  
  # nation list
  list.non.corresponding.author.sa.all.ranking <- table( list.non.corresponding.author.sa.all[,8] )
  list.non.corresponding.author.sa.all.ranking <- data.frame( rbind(list.non.corresponding.author.sa.all.ranking) )
  list.non.corresponding.author.sa.all.ranking <- t(list.non.corresponding.author.sa.all.ranking)
  colnames( list.non.corresponding.author.sa.all.ranking ) <- c("ranking")
  list.non.corresponding.author.sa.all.ranking <- data.frame(
    cbind(
      rownames( list.non.corresponding.author.sa.all.ranking ),
      matrix( list.non.corresponding.author.sa.all.ranking )
    )
  )
  colnames( list.non.corresponding.author.sa.all.ranking ) <- c("non-correspo", "abundance")
  list.non.corresponding.author.sa.all.ranking <- list.non.corresponding.author.sa.all.ranking[order( as.integer(list.non.corresponding.author.sa.all.ranking$abundance), decreasing=TRUE ),]
  rownames( list.non.corresponding.author.sa.all.ranking ) <- 1:length( list.non.corresponding.author.sa.all.ranking[,1] )
}

##-- All the correspoding authors in papers including non-corresponding authors from Western --##
if( !is.null(list.corresponding.author.for.non.crsp.sa) ){
  
  # nation list
  list.corresponding.author.for.non.crsp.sa.ranking <- table( list.corresponding.author.for.non.crsp.sa[,8] )
  list.corresponding.author.for.non.crsp.sa.ranking <- data.frame( rbind(list.corresponding.author.for.non.crsp.sa.ranking) )
  list.corresponding.author.for.non.crsp.sa.ranking <- t(list.corresponding.author.for.non.crsp.sa.ranking)
  colnames( list.corresponding.author.for.non.crsp.sa.ranking ) <- c("ranking")
  list.corresponding.author.for.non.crsp.sa.ranking <- data.frame(
    cbind(
      rownames( list.corresponding.author.for.non.crsp.sa.ranking ),
      matrix( list.corresponding.author.for.non.crsp.sa.ranking )
    )
  )
  colnames( list.corresponding.author.for.non.crsp.sa.ranking ) <- c("correspo", "abundance")
  list.corresponding.author.for.non.crsp.sa.ranking <- list.corresponding.author.for.non.crsp.sa.ranking[order( as.integer(list.corresponding.author.for.non.crsp.sa.ranking$abundance), decreasing=TRUE ),]
  rownames( list.corresponding.author.for.non.crsp.sa.ranking ) <- 1:length( list.corresponding.author.for.non.crsp.sa.ranking[,1] )
}


##-- Western (Correspo) vs local (Non-correspo) --##
if( !is.null(list.crsp.other.for.non.crsp.sa) ){
  
  # nation list
  list.crsp.other.for.non.crsp.sa.ranking <- table( list.crsp.other.for.non.crsp.sa[,8] )
  list.crsp.other.for.non.crsp.sa.ranking <- data.frame( rbind(list.crsp.other.for.non.crsp.sa.ranking) )
  list.crsp.other.for.non.crsp.sa.ranking <- t(list.crsp.other.for.non.crsp.sa.ranking)
  colnames( list.crsp.other.for.non.crsp.sa.ranking ) <- c("ranking")
  list.crsp.other.for.non.crsp.sa.ranking <- data.frame(
    cbind(
      rownames( list.crsp.other.for.non.crsp.sa.ranking ),
      matrix( list.crsp.other.for.non.crsp.sa.ranking )
    )
  )
  colnames( list.crsp.other.for.non.crsp.sa.ranking ) <- c("correspo", "abundance")
  list.crsp.other.for.non.crsp.sa.ranking <- list.crsp.other.for.non.crsp.sa.ranking[order( as.integer(list.crsp.other.for.non.crsp.sa.ranking$abundance), decreasing=TRUE ),]
  rownames( list.crsp.other.for.non.crsp.sa.ranking ) <- 1:length( list.crsp.other.for.non.crsp.sa.ranking[,1] )
}

##-- Non-correspoding authors [Non-native (Correspo) vs Native (Non-correspo)] --##

##-- Correspoding authors [Non-native (Correspo) vs Native (Non-correspo)] --##
if( !is.null(list.crsp.non.native.sa) ){
  
  # nation list
  list.crsp.non.native.sa.ranking <- table( list.crsp.non.native.sa[,8] )
  list.crsp.non.native.sa.ranking <- data.frame( rbind(list.crsp.non.native.sa.ranking) )
  list.crsp.non.native.sa.ranking <- t(list.crsp.non.native.sa.ranking)
  colnames( list.crsp.non.native.sa.ranking ) <- c("ranking")
  list.crsp.non.native.sa.ranking <- data.frame(
    cbind(
      rownames( list.crsp.non.native.sa.ranking ),
      matrix( list.crsp.non.native.sa.ranking )
    )
  )
  colnames( list.crsp.non.native.sa.ranking ) <- c("correspo", "abundance")
  list.crsp.non.native.sa.ranking <- list.crsp.non.native.sa.ranking[order( as.integer(list.crsp.non.native.sa.ranking$abundance), decreasing=TRUE ),]
  rownames( list.crsp.non.native.sa.ranking ) <- 1:length( list.crsp.non.native.sa.ranking[,1] )
}

##-- Non-correspoding authors [Native (Correspo) vs Native (Non-correspo)] --##
if( !is.null(list.crsp.non.native.sa) ){
  
  nats <- c()
  
  for ( i in 1:len.csv.list ) {
    
    dat <- read.csv( csv_list[i] )
    
    len.crsps <- length( which( list.crsp.non.native.sa[,1] == csv_list[i] ) )
    crsps <- list.crsp.non.native.sa[which( list.crsp.non.native.sa[,1] == csv_list[i] ),]
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
if( !is.null(list.crsp.native.sa) ){
  
  # nation list
  list.crsp.native.sa.ranking <- table( list.crsp.native.sa[,8] )
  list.crsp.native.sa.ranking <- data.frame( rbind(list.crsp.native.sa.ranking) )
  list.crsp.native.sa.ranking <- t(list.crsp.native.sa.ranking)
  colnames( list.crsp.native.sa.ranking ) <- c("ranking")
  list.crsp.native.sa.ranking <- data.frame(
    cbind(
      rownames( list.crsp.native.sa.ranking ),
      matrix( list.crsp.native.sa.ranking )
    )
  )
  colnames( list.crsp.native.sa.ranking ) <- c("correspo", "abundance")
  list.crsp.native.sa.ranking <- list.crsp.native.sa.ranking[order( as.integer(list.crsp.native.sa.ranking$abundance), decreasing=TRUE ),]
  rownames( list.crsp.native.sa.ranking ) <- 1:length( list.crsp.native.sa.ranking[,1] )
}

##-- Non-correspoding authors [Native (Correspo) vs Native (Non-correspo)] --##
if( !is.null(list.crsp.native.sa) ){
  
  nats <- c()
  
  for ( i in 1:len.csv.list ) {
    
    dat <- read.csv( csv_list[i] )
    
    len.crsps <- length( which( list.crsp.native.sa[,1] == csv_list[i] ) )
    crsps <- list.crsp.native.sa[which( list.crsp.native.sa[,1] == csv_list[i] ),]
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
if( !is.null(list.corresponding.author.sa) ){
  
  # nation list
  list.corresponding.author.sa.ranking <- table( list.corresponding.author.sa[,8] )
  list.corresponding.author.sa.ranking <- data.frame( rbind(list.corresponding.author.sa.ranking) )
  list.corresponding.author.sa.ranking <- t(list.corresponding.author.sa.ranking)
  colnames( list.corresponding.author.sa.ranking ) <- c("ranking")
  list.corresponding.author.sa.ranking <- data.frame(
    cbind(
      rownames( list.corresponding.author.sa.ranking ),
      matrix( list.corresponding.author.sa.ranking )
    )
  )
  colnames( list.corresponding.author.sa.ranking ) <- c("correspo", "abundance")
  list.corresponding.author.sa.ranking <- list.corresponding.author.sa.ranking[order( as.integer(list.corresponding.author.sa.ranking$abundance), decreasing=TRUE ),]
  rownames( list.corresponding.author.sa.ranking ) <- 1:length( list.corresponding.author.sa.ranking[,1] )
}

if( !is.null(list.corresponding.author.sa) ){
  
  nats <- c()
  
  for ( i in 1:len.csv.list ) {
    
    dat <- read.csv( csv_list[i] )
    
    len.crsps <- length( which( list.corresponding.author.sa[,1] == csv_list[i] ) )
    crsps <- list.corresponding.author.sa[which( list.corresponding.author.sa[,1] == csv_list[i] ),]
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
if( !is.null(list.crsp.only.sa) ){
  
  # nation list
  list.crsp.only.sa.ranking <- table( list.crsp.only.sa[,8] )
  list.crsp.only.sa.ranking <- data.frame( rbind(list.crsp.only.sa.ranking) )
  list.crsp.only.sa.ranking <- t(list.crsp.only.sa.ranking)
  colnames( list.crsp.only.sa.ranking ) <- c("ranking")
  list.crsp.only.sa.ranking <- data.frame(
    cbind(
      rownames( list.crsp.only.sa.ranking ),
      matrix( list.crsp.only.sa.ranking )
    )
  )
  colnames( list.crsp.only.sa.ranking ) <- c("correspo", "abundance")
  list.crsp.only.sa.ranking <- list.crsp.only.sa.ranking[order( as.integer(list.crsp.only.sa.ranking$abundance), decreasing=TRUE ),]
  rownames( list.crsp.only.sa.ranking ) <- 1:length( list.crsp.only.sa.ranking[,1] )
}
