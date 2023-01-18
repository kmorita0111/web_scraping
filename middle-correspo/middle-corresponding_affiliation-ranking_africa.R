#install.packages("openxlsx")
library("openxlsx")

#########################################################
###--- Non-corresponding author ranking in Western ---###
#########################################################
##-- All the non-correspoding authors from Western --##
if( !is.null(list.non.corresponding.author.af.all) ){
  
  # nation list
  list.non.corresponding.author.af.all.ranking <- table( list.non.corresponding.author.af.all[,8] )
  list.non.corresponding.author.af.all.ranking <- data.frame( rbind(list.non.corresponding.author.af.all.ranking) )
  list.non.corresponding.author.af.all.ranking <- t(list.non.corresponding.author.af.all.ranking)
  colnames( list.non.corresponding.author.af.all.ranking ) <- c("ranking")
  list.non.corresponding.author.af.all.ranking <- data.frame(
    cbind(
      rownames( list.non.corresponding.author.af.all.ranking ),
      matrix( list.non.corresponding.author.af.all.ranking )
    )
  )
  colnames( list.non.corresponding.author.af.all.ranking ) <- c("non-correspo", "abundance")
  list.non.corresponding.author.af.all.ranking <- list.non.corresponding.author.af.all.ranking[order( as.integer(list.non.corresponding.author.af.all.ranking$abundance), decreasing=TRUE ),]
  rownames( list.non.corresponding.author.af.all.ranking ) <- 1:length( list.non.corresponding.author.af.all.ranking[,1] )
}

##-- All the correspoding authors in papers including non-corresponding authors from Western --##
if( !is.null(list.corresponding.author.for.non.crsp.af) ){
  
  # nation list
  list.corresponding.author.for.non.crsp.af.ranking <- table( list.corresponding.author.for.non.crsp.af[,8] )
  list.corresponding.author.for.non.crsp.af.ranking <- data.frame( rbind(list.corresponding.author.for.non.crsp.af.ranking) )
  list.corresponding.author.for.non.crsp.af.ranking <- t(list.corresponding.author.for.non.crsp.af.ranking)
  colnames( list.corresponding.author.for.non.crsp.af.ranking ) <- c("ranking")
  list.corresponding.author.for.non.crsp.af.ranking <- data.frame(
    cbind(
      rownames( list.corresponding.author.for.non.crsp.af.ranking ),
      matrix( list.corresponding.author.for.non.crsp.af.ranking )
    )
  )
  colnames( list.corresponding.author.for.non.crsp.af.ranking ) <- c("correspo", "abundance")
  list.corresponding.author.for.non.crsp.af.ranking <- list.corresponding.author.for.non.crsp.af.ranking[order( as.integer(list.corresponding.author.for.non.crsp.af.ranking$abundance), decreasing=TRUE ),]
  rownames( list.corresponding.author.for.non.crsp.af.ranking ) <- 1:length( list.corresponding.author.for.non.crsp.af.ranking[,1] )
}


##-- Western (Correspo) vs local (Non-correspo) --##
if( !is.null(list.crsp.other.for.non.crsp.af) ){
  
  # nation list
  list.crsp.other.for.non.crsp.af.ranking <- table( list.crsp.other.for.non.crsp.af[,8] )
  list.crsp.other.for.non.crsp.af.ranking <- data.frame( rbind(list.crsp.other.for.non.crsp.af.ranking) )
  list.crsp.other.for.non.crsp.af.ranking <- t(list.crsp.other.for.non.crsp.af.ranking)
  colnames( list.crsp.other.for.non.crsp.af.ranking ) <- c("ranking")
  list.crsp.other.for.non.crsp.af.ranking <- data.frame(
    cbind(
      rownames( list.crsp.other.for.non.crsp.af.ranking ),
      matrix( list.crsp.other.for.non.crsp.af.ranking )
    )
  )
  colnames( list.crsp.other.for.non.crsp.af.ranking ) <- c("correspo", "abundance")
  list.crsp.other.for.non.crsp.af.ranking <- list.crsp.other.for.non.crsp.af.ranking[order( as.integer(list.crsp.other.for.non.crsp.af.ranking$abundance), decreasing=TRUE ),]
  rownames( list.crsp.other.for.non.crsp.af.ranking ) <- 1:length( list.crsp.other.for.non.crsp.af.ranking[,1] )
}

##-- Non-correspoding authors [Non-native (Correspo) vs Native (Non-correspo)] --##

##-- Correspoding authors [Non-native (Correspo) vs Native (Non-correspo)] --##
if( !is.null(list.crsp.non.native.af) ){
  
  # nation list
  list.crsp.non.native.af.ranking <- table( list.crsp.non.native.af[,8] )
  list.crsp.non.native.af.ranking <- data.frame( rbind(list.crsp.non.native.af.ranking) )
  list.crsp.non.native.af.ranking <- t(list.crsp.non.native.af.ranking)
  colnames( list.crsp.non.native.af.ranking ) <- c("ranking")
  list.crsp.non.native.af.ranking <- data.frame(
    cbind(
      rownames( list.crsp.non.native.af.ranking ),
      matrix( list.crsp.non.native.af.ranking )
    )
  )
  colnames( list.crsp.non.native.af.ranking ) <- c("correspo", "abundance")
  list.crsp.non.native.af.ranking <- list.crsp.non.native.af.ranking[order( as.integer(list.crsp.non.native.af.ranking$abundance), decreasing=TRUE ),]
  rownames( list.crsp.non.native.af.ranking ) <- 1:length( list.crsp.non.native.af.ranking[,1] )
}

##-- Non-correspoding authors [Native (Correspo) vs Native (Non-correspo)] --##

##-- Correspoding authors [Native (Correspo) vs Native (Non-correspo)] --##
if( !is.null(list.crsp.native.af) ){
  
  # nation list
  list.crsp.native.af.ranking <- table( list.crsp.native.af[,8] )
  list.crsp.native.af.ranking <- data.frame( rbind(list.crsp.native.af.ranking) )
  list.crsp.native.af.ranking <- t(list.crsp.native.af.ranking)
  colnames( list.crsp.native.af.ranking ) <- c("ranking")
  list.crsp.native.af.ranking <- data.frame(
    cbind(
      rownames( list.crsp.native.af.ranking ),
      matrix( list.crsp.native.af.ranking )
    )
  )
  colnames( list.crsp.native.af.ranking ) <- c("correspo", "abundance")
  list.crsp.native.af.ranking <- list.crsp.native.af.ranking[order( as.integer(list.crsp.native.af.ranking$abundance), decreasing=TRUE ),]
  rownames( list.crsp.native.af.ranking ) <- 1:length( list.crsp.native.af.ranking[,1] )
}

##-- Non-correspoding authors [Native (Correspo) vs Native (Non-correspo)] --##
if( !is.null(list.crsp.native.af) ){
  
  nats <- c()
  
  for ( i in 1:len.csv.list ) {
    
    dat <- read.csv( csv_list[i] )
    
    len.crsps <- length( which( list.crsp.native.af[,1] == csv_list[i] ) )
    crsps <- list.crsp.native.af[which( list.crsp.native.af[,1] == csv_list[i] ),]
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
if( !is.null(list.corresponding.author.af) ){
  
  # nation list
  list.corresponding.author.af.ranking <- table( list.corresponding.author.af[,8] )
  list.corresponding.author.af.ranking <- data.frame( rbind(list.corresponding.author.af.ranking) )
  list.corresponding.author.af.ranking <- t(list.corresponding.author.af.ranking)
  colnames( list.corresponding.author.af.ranking ) <- c("ranking")
  list.corresponding.author.af.ranking <- data.frame(
    cbind(
      rownames( list.corresponding.author.af.ranking ),
      matrix( list.corresponding.author.af.ranking )
    )
  )
  colnames( list.corresponding.author.af.ranking ) <- c("correspo", "abundance")
  list.corresponding.author.af.ranking <- list.corresponding.author.af.ranking[order( as.integer(list.corresponding.author.af.ranking$abundance), decreasing=TRUE ),]
  rownames( list.corresponding.author.af.ranking ) <- 1:length( list.corresponding.author.af.ranking[,1] )
}

##-- non-corresponding author --##
if( !is.null(list.corresponding.author.af) ){
  
  nats <- c()
  
  for ( i in 1:len.csv.list ) {
    
    dat <- read.csv( csv_list[i] )
    
    len.crsps <- length( which( list.corresponding.author.af[,1] == csv_list[i] ) )
    crsps <- list.corresponding.author.af[which( list.corresponding.author.af[,1] == csv_list[i] ),]
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
if( !is.null(list.crsp.only.af) ){
  
  #length(list.crsp.only.af[,1])
  
  # nation list
  list.crsp.only.af.ranking <- table( list.crsp.only.af[,8] )
  list.crsp.only.af.ranking <- data.frame( rbind(list.crsp.only.af.ranking) )
  list.crsp.only.af.ranking <- t(list.crsp.only.af.ranking)
  colnames( list.crsp.only.af.ranking ) <- c("ranking")
  list.crsp.only.af.ranking <- data.frame(
    cbind(
      rownames( list.crsp.only.af.ranking ),
      matrix( list.crsp.only.af.ranking )
    )
  )
  colnames( list.crsp.only.af.ranking ) <- c("correspo", "abundance")
  list.crsp.only.af.ranking <- list.crsp.only.af.ranking[order( as.integer(list.crsp.only.af.ranking$abundance), decreasing=TRUE ),]
  rownames( list.crsp.only.af.ranking ) <- 1:length( list.crsp.only.af.ranking[,1] )
}
