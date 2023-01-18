list.affils <- list.crsp.non.native.w
if( !is.null(list.affils) ){
  
  # nation list
  list.affils.ranking <- table( list.affils[,13] )
  list.affils.ranking <- data.frame( rbind(list.affils.ranking) )
  list.affils.ranking <- t(list.affils.ranking)
  colnames( list.affils.ranking ) <- c("ranking")
  list.affils.ranking <- data.frame(
    cbind(
      rownames( list.affils.ranking ),
      matrix( list.affils.ranking )
    )
  )
  colnames( list.affils.ranking ) <- c("non-correspo", "abundance")
  list.affils.ranking <- list.affils.ranking[order( as.integer(list.affils.ranking$abundance), decreasing=TRUE ),]
  rownames( list.affils.ranking ) <- 1:length( list.affils.ranking[,1] )
}
