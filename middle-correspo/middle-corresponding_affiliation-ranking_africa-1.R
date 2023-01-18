#install.packages("openxlsx")
library("openxlsx")

#########################################################
###--- Non-corresponding author ranking in Western ---###
#########################################################
##-- All the non-correspoding authors from Western --##
if( !is.null(list.non.corresponding.author.ea.all) ){
  
  # nation list
  list.non.corresponding.author.ea.all.ranking <- table( list.non.corresponding.author.ea.all[,8] )
  list.non.corresponding.author.ea.all.ranking <- data.frame( rbind(list.non.corresponding.author.ea.all.ranking) )
  list.non.corresponding.author.ea.all.ranking <- t(list.non.corresponding.author.ea.all.ranking)
  colnames( list.non.corresponding.author.ea.all.ranking ) <- c("ranking")
  list.non.corresponding.author.ea.all.ranking <- data.frame(
    cbind(
      rownames( list.non.corresponding.author.ea.all.ranking ),
      matrix( list.non.corresponding.author.ea.all.ranking )
    )
  )
  colnames( list.non.corresponding.author.ea.all.ranking ) <- c("non-correspo", "abundance")
  list.non.corresponding.author.ea.all.ranking <- list.non.corresponding.author.ea.all.ranking[order( as.integer(list.non.corresponding.author.ea.all.ranking$abundance), decreasing=TRUE ),]
  rownames( list.non.corresponding.author.ea.all.ranking ) <- 1:length( list.non.corresponding.author.ea.all.ranking[,1] )
}

##-- All the correspoding authors in papers including non-corresponding authors from Western --##
if( !is.null(list.corresponding.author.for.non.crsp.ea) ){
  
  # nation list
  list.corresponding.author.for.non.crsp.ea.ranking <- table( list.corresponding.author.for.non.crsp.ea[,8] )
  list.corresponding.author.for.non.crsp.ea.ranking <- data.frame( rbind(list.corresponding.author.for.non.crsp.ea.ranking) )
  list.corresponding.author.for.non.crsp.ea.ranking <- t(list.corresponding.author.for.non.crsp.ea.ranking)
  colnames( list.corresponding.author.for.non.crsp.ea.ranking ) <- c("ranking")
  list.corresponding.author.for.non.crsp.ea.ranking <- data.frame(
    cbind(
      rownames( list.corresponding.author.for.non.crsp.ea.ranking ),
      matrix( list.corresponding.author.for.non.crsp.ea.ranking )
    )
  )
  colnames( list.corresponding.author.for.non.crsp.ea.ranking ) <- c("correspo", "abundance")
  list.corresponding.author.for.non.crsp.ea.ranking <- list.corresponding.author.for.non.crsp.ea.ranking[order( as.integer(list.corresponding.author.for.non.crsp.ea.ranking$abundance), decreasing=TRUE ),]
  rownames( list.corresponding.author.for.non.crsp.ea.ranking ) <- 1:length( list.corresponding.author.for.non.crsp.ea.ranking[,1] )
}


##-- Western (Correspo) vs local (Non-correspo) --##
#- corresponding author -#
if( !is.null(list.crsp.other.for.non.crsp.ea) ){
  
  # nation list
  list.crsp.other.for.non.crsp.ea.ranking <- table( list.crsp.other.for.non.crsp.ea[,8] )
  list.crsp.other.for.non.crsp.ea.ranking <- data.frame( rbind(list.crsp.other.for.non.crsp.ea.ranking) )
  list.crsp.other.for.non.crsp.ea.ranking <- t(list.crsp.other.for.non.crsp.ea.ranking)
  colnames( list.crsp.other.for.non.crsp.ea.ranking ) <- c("ranking")
  list.crsp.other.for.non.crsp.ea.ranking <- data.frame(
    cbind(
      rownames( list.crsp.other.for.non.crsp.ea.ranking ),
      matrix( list.crsp.other.for.non.crsp.ea.ranking )
    )
  )
  colnames( list.crsp.other.for.non.crsp.ea.ranking ) <- c("correspo", "abundance")
  list.crsp.other.for.non.crsp.ea.ranking <- list.crsp.other.for.non.crsp.ea.ranking[order( as.integer(list.crsp.other.for.non.crsp.ea.ranking$abundance), decreasing=TRUE ),]
  rownames( list.crsp.other.for.non.crsp.ea.ranking ) <- 1:length( list.crsp.other.for.non.crsp.ea.ranking[,1] )
}
#- non-corresponding author -#
if( !is.null(list.non.crsp.author.ea.crsp.other) ){
  
  # nation list
  list.non.crsp.author.ea.crsp.other.ranking <- table( list.non.crsp.author.ea.crsp.other[,8] )
  list.non.crsp.author.ea.crsp.other.ranking <- data.frame( rbind(list.non.crsp.author.ea.crsp.other.ranking) )
  list.non.crsp.author.ea.crsp.other.ranking <- t(list.non.crsp.author.ea.crsp.other.ranking)
  colnames( list.non.crsp.author.ea.crsp.other.ranking ) <- c("ranking")
  list.non.crsp.author.ea.crsp.other.ranking <- data.frame(
    cbind(
      rownames( list.non.crsp.author.ea.crsp.other.ranking ),
      matrix( list.non.crsp.author.ea.crsp.other.ranking )
    )
  )
  colnames( list.non.crsp.author.ea.crsp.other.ranking ) <- c("correspo", "abundance")
  list.non.crsp.author.ea.crsp.other.ranking <- list.non.crsp.author.ea.crsp.other.ranking[order( as.integer(list.non.crsp.author.ea.crsp.other.ranking$abundance), decreasing=TRUE ),]
  rownames( list.non.crsp.author.ea.crsp.other.ranking ) <- 1:length( list.non.crsp.author.ea.crsp.other.ranking[,1] )
}

##-- Non-correspoding authors [Non-native (Correspo) vs Native (Non-correspo)] --##
if( !is.null(list.non.crsp.author.ea.crsp.non.native) ){
  
  # nation list
  list.non.crsp.author.ea.crsp.non.native.ranking <- table( list.non.crsp.author.ea.crsp.non.native[,8] )
  list.non.crsp.author.ea.crsp.non.native.ranking <- data.frame( rbind(list.non.crsp.author.ea.crsp.non.native.ranking) )
  list.non.crsp.author.ea.crsp.non.native.ranking <- t(list.non.crsp.author.ea.crsp.non.native.ranking)
  colnames( list.non.crsp.author.ea.crsp.non.native.ranking ) <- c("ranking")
  list.non.crsp.author.ea.crsp.non.native.ranking <- data.frame(
    cbind(
      rownames( list.non.crsp.author.ea.crsp.non.native.ranking ),
      matrix( list.non.crsp.author.ea.crsp.non.native.ranking )
    )
  )
  colnames( list.non.crsp.author.ea.crsp.non.native.ranking ) <- c("correspo", "abundance")
  list.non.crsp.author.ea.crsp.non.native.ranking <- list.non.crsp.author.ea.crsp.non.native.ranking[order( as.integer(list.non.crsp.author.ea.crsp.non.native.ranking$abundance), decreasing=TRUE ),]
  rownames( list.non.crsp.author.ea.crsp.non.native.ranking ) <- 1:length( list.non.crsp.author.ea.crsp.non.native.ranking[,1] )
}

##-- Correspoding authors [Non-native (Correspo) vs Native (Non-correspo)] --##
if( !is.null(list.crsp.non.native.ea) ){
  
  # nation list
  list.crsp.non.native.ea.ranking <- table( list.crsp.non.native.ea[,8] )
  list.crsp.non.native.ea.ranking <- data.frame( rbind(list.crsp.non.native.ea.ranking) )
  list.crsp.non.native.ea.ranking <- t(list.crsp.non.native.ea.ranking)
  colnames( list.crsp.non.native.ea.ranking ) <- c("ranking")
  list.crsp.non.native.ea.ranking <- data.frame(
    cbind(
      rownames( list.crsp.non.native.ea.ranking ),
      matrix( list.crsp.non.native.ea.ranking )
    )
  )
  colnames( list.crsp.non.native.ea.ranking ) <- c("correspo", "abundance")
  list.crsp.non.native.ea.ranking <- list.crsp.non.native.ea.ranking[order( as.integer(list.crsp.non.native.ea.ranking$abundance), decreasing=TRUE ),]
  rownames( list.crsp.non.native.ea.ranking ) <- 1:length( list.crsp.non.native.ea.ranking[,1] )
}

##-- Non-correspoding authors [Native (Correspo) vs Native (Non-correspo)] --##
if( !is.null(list.crsp.author.ea.crsp.non.native) ){
  
  # nation list
  list.crsp.author.ea.crsp.non.native.ranking <- table( list.crsp.author.ea.crsp.non.native[,8] )
  list.crsp.author.ea.crsp.non.native.ranking <- data.frame( rbind(list.crsp.author.ea.crsp.non.native.ranking) )
  list.crsp.author.ea.crsp.non.native.ranking <- t(list.crsp.author.ea.crsp.non.native.ranking)
  colnames( list.crsp.author.ea.crsp.non.native.ranking ) <- c("ranking")
  list.crsp.author.ea.crsp.non.native.ranking <- data.frame(
    cbind(
      rownames( list.crsp.author.ea.crsp.non.native.ranking ),
      matrix( list.crsp.author.ea.crsp.non.native.ranking )
    )
  )
  colnames( list.crsp.author.ea.crsp.non.native.ranking ) <- c("correspo", "abundance")
  list.crsp.author.ea.crsp.non.native.ranking <- list.crsp.author.ea.crsp.non.native.ranking[order( as.integer(list.crsp.author.ea.crsp.non.native.ranking$abundance), decreasing=TRUE ),]
  rownames( list.crsp.author.ea.crsp.non.native.ranking ) <- 1:length( list.crsp.author.ea.crsp.non.native.ranking[,1] )
}

##-- Correspoding authors [Native (Correspo) vs Native (Non-correspo)] --##
if( !is.null(list.crsp.native.ea) ){
  
  # nation list
  list.crsp.native.ea.ranking <- table( list.crsp.native.ea[,8] )
  list.crsp.native.ea.ranking <- data.frame( rbind(list.crsp.native.ea.ranking) )
  list.crsp.native.ea.ranking <- t(list.crsp.native.ea.ranking)
  colnames( list.crsp.native.ea.ranking ) <- c("ranking")
  list.crsp.native.ea.ranking <- data.frame(
    cbind(
      rownames( list.crsp.native.ea.ranking ),
      matrix( list.crsp.native.ea.ranking )
    )
  )
  colnames( list.crsp.native.ea.ranking ) <- c("correspo", "abundance")
  list.crsp.native.ea.ranking <- list.crsp.native.ea.ranking[order( as.integer(list.crsp.native.ea.ranking$abundance), decreasing=TRUE ),]
  rownames( list.crsp.native.ea.ranking ) <- 1:length( list.crsp.native.ea.ranking[,1] )
}

#####################################################
###--- Corresponding author ranking in Western ---###
#####################################################
##-- All the correspoding authors from Western in papers not including authors from the other region --##
#- corresponding author -#
if( !is.null(list.corresponding.author.ea) ){
  
  # nation list
  list.corresponding.author.ea.ranking <- table( list.corresponding.author.ea[,8] )
  list.corresponding.author.ea.ranking <- data.frame( rbind(list.corresponding.author.ea.ranking) )
  list.corresponding.author.ea.ranking <- t(list.corresponding.author.ea.ranking)
  colnames( list.corresponding.author.ea.ranking ) <- c("ranking")
  list.corresponding.author.ea.ranking <- data.frame(
    cbind(
      rownames( list.corresponding.author.ea.ranking ),
      matrix( list.corresponding.author.ea.ranking )
    )
  )
  colnames( list.corresponding.author.ea.ranking ) <- c("correspo", "abundance")
  list.corresponding.author.ea.ranking <- list.corresponding.author.ea.ranking[order( as.integer(list.corresponding.author.ea.ranking$abundance), decreasing=TRUE ),]
  rownames( list.corresponding.author.ea.ranking ) <- 1:length( list.corresponding.author.ea.ranking[,1] )
}
#- non-corresponding author -#
if( !is.null(list.non.correspo.other.crsp.ea) ){
  
  # nation list
  list.non.correspo.other.crsp.ea.ranking <- table( list.non.correspo.other.crsp.ea[,8] )
  list.non.correspo.other.crsp.ea.ranking <- data.frame( rbind(list.non.correspo.other.crsp.ea.ranking) )
  list.non.correspo.other.crsp.ea.ranking <- t(list.non.correspo.other.crsp.ea.ranking)
  colnames( list.non.correspo.other.crsp.ea.ranking ) <- c("ranking")
  list.non.correspo.other.crsp.ea.ranking <- data.frame(
    cbind(
      rownames( list.non.correspo.other.crsp.ea.ranking ),
      matrix( list.non.correspo.other.crsp.ea.ranking )
    )
  )
  colnames( list.non.correspo.other.crsp.ea.ranking ) <- c("correspo", "abundance")
  list.non.correspo.other.crsp.ea.ranking <- list.non.correspo.other.crsp.ea.ranking[order( as.integer(list.non.correspo.other.crsp.ea.ranking$abundance), decreasing=TRUE ),]
  rownames( list.non.correspo.other.crsp.ea.ranking ) <- 1:length( list.non.correspo.other.crsp.ea.ranking[,1] )
}

##-- Correspoding authors [Western (Correspo) vs the others are Western (Non-correspo)] --##
#- corresponding author -#
if( !is.null(list.crsp.only.ea) ){
  
  # nation list
  list.crsp.only.ea.ranking <- table( list.crsp.only.ea[,8] )
  list.crsp.only.ea.ranking <- data.frame( rbind(list.crsp.only.ea.ranking) )
  list.crsp.only.ea.ranking <- t(list.crsp.only.ea.ranking)
  colnames( list.crsp.only.ea.ranking ) <- c("ranking")
  list.crsp.only.ea.ranking <- data.frame(
    cbind(
      rownames( list.crsp.only.ea.ranking ),
      matrix( list.crsp.only.ea.ranking )
    )
  )
  colnames( list.crsp.only.ea.ranking ) <- c("correspo", "abundance")
  list.crsp.only.ea.ranking <- list.crsp.only.ea.ranking[order( as.integer(list.crsp.only.ea.ranking$abundance), decreasing=TRUE ),]
  rownames( list.crsp.only.ea.ranking ) <- 1:length( list.crsp.only.ea.ranking[,1] )
}
#- non-corresponding author -#
if( !is.null(list.non.correspo.other.crsp.only.ea) ){
  
  # nation list
  list.non.correspo.other.crsp.only.ea.ranking <- table( list.non.correspo.other.crsp.only.ea[,8] )
  list.non.correspo.other.crsp.only.ea.ranking <- data.frame( rbind(list.non.correspo.other.crsp.only.ea.ranking) )
  list.non.correspo.other.crsp.only.ea.ranking <- t(list.non.correspo.other.crsp.only.ea.ranking)
  colnames( list.non.correspo.other.crsp.only.ea.ranking ) <- c("ranking")
  list.non.correspo.other.crsp.only.ea.ranking <- data.frame(
    cbind(
      rownames( list.non.correspo.other.crsp.only.ea.ranking ),
      matrix( list.non.correspo.other.crsp.only.ea.ranking )
    )
  )
  colnames( list.non.correspo.other.crsp.only.ea.ranking ) <- c("correspo", "abundance")
  list.non.correspo.other.crsp.only.ea.ranking <- list.non.correspo.other.crsp.only.ea.ranking[order( as.integer(list.non.correspo.other.crsp.only.ea.ranking$abundance), decreasing=TRUE ),]
  rownames( list.non.correspo.other.crsp.only.ea.ranking ) <- 1:length( list.non.correspo.other.crsp.only.ea.ranking[,1] )
}

