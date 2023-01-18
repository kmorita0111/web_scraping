###--- setting working directory ---###
journal.dir <- "ecology"
wd.name <- paste( paste("~/web_scraping",journal.dir,sep="/"), "result2023_with_nation-1", sep="/" )
setwd( wd.name )

###--- csv list ---###
csv_list <- list.files( pattern = "*.csv" )
len.csv.list <- length( csv_list )

###--- file name & shaping into the same length ---###
filename <- c()
recorder.af.global <- c(); recorder.af.local <- c(); recorder.af.global.all <- c(); recorder.af.local.all <- c()
recorder.af.crsp <- c(); recorder.af.non.crsp <- c()
recorder.af.global <- c(); recorder.af.local <- c(); recorder.af.global.all <- c(); recorder.af.local.all <- c()
recorder.af.crsp <- c(); recorder.af.non.crsp <- c()
recorder.sa.global <- c(); recorder.sa.local <- c(); recorder.sa.global.all <- c(); recorder.sa.local.all <- c()
recorder.sa.crsp <- c(); recorder.sa.non.crsp <- c()
recorder.w.global <- c(); recorder.w.local <- c(); recorder.w.global.all <- c(); recorder.w.local.all <- c()
recorder.w.crsp <- c(); recorder.w.non.crsp <- c()

###--- The number of all papers ---###
num.all.paper <- 0
for ( i in 1:len.csv.list ) {
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  num.all.paper <- num.all.paper + dat[length(dat[,1]),1]+1
}
print( paste( "The sum of all papers =", as.character(num.all.paper) ) )

##############################################################
###--- The number of corresponding authors in Africa ---###
##############################################################
print( "======( Africa )======" )
######################################################################################
###--- non-corresponding author from Africa (do not include corresponding author) ---###
######################################################################################
print( "--- ( Non-corresponding author from Africa ) ---" )
list.non.corresponding.author.af.all <- c()
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.list <- c( which(dat$area_1=="Africa"), which(dat$correspondance==0) )
  num.non.corresponding.author.af <- num.list[duplicated( num.list )]
  len.non.corresponding.author.af <- length( num.non.corresponding.author.af )
  if( len.non.corresponding.author.af > 0 ){
    
    new.list <- cbind(
      rep(csv_list[i],length=len.non.corresponding.author.af),
      dat[num.non.corresponding.author.af,1],
      dat[num.non.corresponding.author.af,]$title,
      dat[num.non.corresponding.author.af,]$author,
      dat[num.non.corresponding.author.af,]$status,
      dat[num.non.corresponding.author.af,]$correspondance,
      dat[num.non.corresponding.author.af,]$affiliation_1,
      dat[num.non.corresponding.author.af,]$nation_1,
      dat[num.non.corresponding.author.af,]$area_1
    )
    list.non.corresponding.author.af.all <- rbind( list.non.corresponding.author.af.all,
                                                   new.list
    )
  }
  
}
if( !is.null(list.non.corresponding.author.af.all) ){
  colnames( list.non.corresponding.author.af.all ) <- c( "volume_issue", "id", "title", "author", "status", "correspondance", "affiliation_1", "nation_1", "area_1" )
}
###--- corresponding authors for non-corresponding authors from Africa ---###
list.corresponding.author.for.non.crsp.af <- c()
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.new.list <- which( csv_list[i]==list.non.corresponding.author.af.all[,1] )
  new.list <- c()
  if( length(num.new.list) == 1 ){
    new.list <- t(list.non.corresponding.author.af.all[num.new.list,])
  } else if( length(num.new.list) > 1 ){
    new.list <- list.non.corresponding.author.af.all[num.new.list,]
  }

  if( length(num.new.list) > 0 ){

    for ( j in 1:length(num.new.list) ) {
      
      # issue number & corresponding author
      nums <- c( which( dat[,1]==as.integer(new.list[j,2]) ), which( dat$correspondance==1 ) )
      new.nums <- nums[duplicated( nums )]
      new.new.list <- dat[new.nums,] # issue number

      new.new.new.list <- c()
      if( length(new.new.list[,1]) > 0 ){
        new.new.new.list <- cbind(
          rep(csv_list[i],length=length(new.new.list[,1])),
          new.new.list[,1],
          new.new.list$title,
          new.new.list$author,
          new.new.list$status,
          new.new.list$correspondance,
          new.new.list$affiliation_1,
          new.new.list$nation_1,
          new.new.list$area_1
        )
      }
      list.corresponding.author.for.non.crsp.af <- rbind( list.corresponding.author.for.non.crsp.af,
                                                          new.new.new.list
      )
    }
  }

}
if( !is.null(list.corresponding.author.for.non.crsp.af) ){
  colnames( list.corresponding.author.for.non.crsp.af ) <- c( "volume_issue", "id", "title", "author", "status", "correspondance", "affiliation_1", "nation_1", "area_1" )
}
vol.iss <- paste( list.corresponding.author.for.non.crsp.af[,1], 
                  as.character(list.corresponding.author.for.non.crsp.af[,2]),
                  sep = "-"
                )
list.corresponding.author.for.non.crsp.af <- list.corresponding.author.for.non.crsp.af[ !duplicated( vol.iss ), ]

###--- print ---###
print( paste("the number of non-corresponding author from Africa:", 
             as.character( length(list.non.corresponding.author.af.all[,1]) )
            ) 
      )
print( paste("the number of papers including non-corresponding author from Africa:", 
             as.character( length(list.corresponding.author.for.non.crsp.af[,1]) )
            ) 
      )
num.corresponding.author.w <- length( which( list.corresponding.author.for.non.crsp.af[,9] != "Africa"  ) )
print( paste("Western (Correspo) vs Africa (Non-correspo):", 
             as.character( num.corresponding.author.w )
            ) 
      )
list.crsp.other.for.non.crsp.af <- list.corresponding.author.for.non.crsp.af[which( list.corresponding.author.for.non.crsp.af[,9] != "East Asia"  ),]
#View(
#  list.corresponding.author.for.non.crsp.af[which( list.corresponding.author.for.non.crsp.af[,9] != "East Asia"  ),]
#)

###--- Non-native (Correspo) vs Native (Non-correspo) ---###
list.crsp.non.native.af <- c()
which(list.corresponding.author.for.non.crsp.af[,9] == "Africa")
new.list <- list.corresponding.author.for.non.crsp.af[which(list.corresponding.author.for.non.crsp.af[,9] == "Africa"),]
list.vol.iss <- paste(list.non.corresponding.author.af.all[,1],
                      as.character(list.non.corresponding.author.af.all[,2]),sep="-")
for( i in 1:length(new.list[,1]) ){
  vol.iss01 <- paste(new.list[i,1],as.character(new.list[i,2]),sep="-")
  new.new.list <- list.non.corresponding.author.af.all[which( list.vol.iss==vol.iss01 ),]
  if( length(which( list.vol.iss==vol.iss01 )) == 1 ){
    new.new.list <- t(new.new.list)
  }
  nums <- which( new.new.list[,8]!=new.list[i,8] )
  if( length(nums) > 0 ){
    list.crsp.non.native.af <- rbind(
      list.crsp.non.native.af, new.list[i,]
    )
  } 
}

print( paste("Non-native (Correspo) vs Native (Non-correspo):", 
             as.character( length(list.crsp.non.native.af[,1]) )
            ) 
      )


###--- Native (Correspo) vs Native (Non-correspo) ---###
list.crsp.native.af <- c()
list.vol.iss01 <- paste(list.crsp.non.native.af[,1],
                      as.character(list.crsp.non.native.af[,2]),sep="-")
new.list <- list.corresponding.author.for.non.crsp.af[which(list.corresponding.author.for.non.crsp.af[,9] == "Africa"),]
list.vol.iss02 <- paste(new.list[,1], as.character(new.list[,2]),sep="-")
list.crsp.native.af <- rbind( list.crsp.non.native.af, new.list )[ !duplicated( c( list.vol.iss01, list.vol.iss02 ) ), ]
list.crsp.native.af <- list.crsp.native.af[-(1:length(list.vol.iss01)),] 

print( paste("Native (Correspo) vs Native (Non-correspo):", 
             as.character( length(list.crsp.native.af[,1]) )
            ) 
      )


######################################################################################
###--- corresponding author from Africa (do not include non-corresponding author) ---###
######################################################################################
print( "--- ( Corresponding author from Africa ) ---" )
list.corresponding.author.af <- c()
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.list <- c( which(dat$area_1=="Africa"), which(dat$correspondance==1) )
  num.corresponding.author.af <- num.list[duplicated( num.list )]
  len.corresponding.author.af <- length( num.corresponding.author.af )
  if( len.corresponding.author.af > 0 ){
    
    new.list <- cbind(
      rep(csv_list[i],length=len.corresponding.author.af),
      dat[num.corresponding.author.af,1],
      dat[num.corresponding.author.af,]$title,
      dat[num.corresponding.author.af,]$author,
      dat[num.corresponding.author.af,]$status,
      dat[num.corresponding.author.af,]$correspondance,
      dat[num.corresponding.author.af,]$affiliation_1,
      dat[num.corresponding.author.af,]$nation_1,
      dat[num.corresponding.author.af,]$area_1
    )
    list.corresponding.author.af <- rbind( list.corresponding.author.af,
                                           new.list
    )
  }
  
}
if( !is.null(list.corresponding.author.af) ){
  colnames( list.corresponding.author.af ) <- c( "volume_issue", "id", "title", "author", "status", "correspondance", "affiliation_1", "nation_1", "area_1" )
}

print( paste("the number of papers including corresponding author from Africa:", 
             as.character( length(list.corresponding.author.af[,1]) )
            ) 
      )

###--- Africa (Correspo) vs the other (Non-correspo) ---###
list.crsp.only.af <- c(); cnt <- 0
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.new.list <- which( csv_list[i]==list.corresponding.author.af[,1] )
  new.list <- c()
  if( length(num.new.list) == 1 ){
    new.list <- t(list.corresponding.author.af[num.new.list,])
  } else if( length(num.new.list) > 1 ){
    new.list <- list.corresponding.author.af[num.new.list,]
  }
  
  if( length(num.new.list) > 0 ){
    
    for ( j in 1:length(num.new.list) ) {

      # issue number & non-corresponding author from except Africa
      nums <- c( which( dat[,1]==as.integer(new.list[j,2]) ), which( dat$correspondance==0 ) )
      new.nums <- nums[duplicated( nums )]
      new.new.list <- dat[new.nums,] # issue number

      # nations match
      nums.nums <- which( new.new.list$area_1 == "Africa" )
      if( length( nums.nums ) > 0 ){

        new.new.list <- new.new.list[nums.nums,]
        new.new.new.list <- c()
        
        if( length(new.new.list[,1]) > 0 ){
          cnt <- cnt + 1
          new.new.new.list <- cbind(
            rep(csv_list[i],length=length(new.new.list[,1])),
            new.new.list[,1],
            new.new.list$title,
            new.new.list$author,
            new.new.list$status,
            new.new.list$correspondance,
            new.new.list$affiliation_1,
            new.new.list$nation_1,
            new.new.list$area_1
          )
          list.crsp.only.af <- rbind( list.crsp.only.af,
                                      new.new.new.list
          )
        }

      }
    }
  }
  
}

list.vol.iss01 <- paste( list.crsp.only.af[,1], as.character(list.crsp.only.af[,2]), sep="-" )
list.crsp.only.af <- list.crsp.only.af[!duplicated(list.vol.iss01),]
list.vol.iss01 <- list.vol.iss01[!duplicated(list.vol.iss01)]
list.vol.iss02 <- paste( list.corresponding.author.af[,1], 
                         as.character(list.corresponding.author.af[,2]), sep="-" )
list.crsp.only.af <- rbind( list.crsp.only.af, list.corresponding.author.af )[ 
  !duplicated( c( list.vol.iss01, list.vol.iss02 ) ), ]
list.crsp.only.af <- list.crsp.only.af[-(1:length(list.vol.iss01)),] 

#if( cnt == 1 ){ list.crsp.only.af <- t(list.crsp.only.af) }
if( !is.null(list.crsp.only.af) ){
  colnames( list.crsp.only.af ) <- c( "volume_issue", "id", "title", "author", "status", "correspondance", "affiliation_1", "nation_1", "area_1" )
}
print( paste( "Africa (Correspo) vs the others are Western (Non-correspo): ",
              as.character( length(list.crsp.only.af[,1]) ) )
)
