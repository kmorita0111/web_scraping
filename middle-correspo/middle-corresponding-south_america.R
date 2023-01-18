###--- setting working directory ---###
journal.dir <- "ecology"
wd.name <- paste( paste("~/web_scraping",journal.dir,sep="/"), "result2023_with_nation-1", sep="/" )
setwd( wd.name )

###--- csv list ---###
csv_list <- list.files( pattern = "*.csv" )
len.csv.list <- length( csv_list )

###--- file name & shaping into the same length ---###
filename <- c()
recorder.ea.global <- c(); recorder.ea.local <- c(); recorder.ea.global.all <- c(); recorder.ea.local.all <- c()
recorder.ea.crsp <- c(); recorder.ea.non.crsp <- c()
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
###--- The number of corresponding authors in South America ---###
##############################################################
print( "======( South America )======" )
######################################################################################
###--- non-corresponding author from South America (do not include corresponding author) ---###
######################################################################################
print( "--- ( Non-corresponding author from South America ) ---" )
list.non.corresponding.author.sa.all <- c()
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.list <- c( which(dat$area_1=="South America"), which(dat$correspondance==0) )
  num.non.corresponding.author.sa <- num.list[duplicated( num.list )]
  len.non.corresponding.author.sa <- length( num.non.corresponding.author.sa )
  if( len.non.corresponding.author.sa > 0 ){
    
    new.list <- cbind(
      rep(csv_list[i],length=len.non.corresponding.author.sa),
      dat[num.non.corresponding.author.sa,1],
      dat[num.non.corresponding.author.sa,]$title,
      dat[num.non.corresponding.author.sa,]$author,
      dat[num.non.corresponding.author.sa,]$status,
      dat[num.non.corresponding.author.sa,]$correspondance,
      dat[num.non.corresponding.author.sa,]$affiliation_1,
      dat[num.non.corresponding.author.sa,]$nation_1,
      dat[num.non.corresponding.author.sa,]$area_1
    )
    list.non.corresponding.author.sa.all <- rbind( list.non.corresponding.author.sa.all,
                                                   new.list
    )
  }
  
}
if( !is.null(list.non.corresponding.author.sa.all) ){
  colnames( list.non.corresponding.author.sa.all ) <- c( "volume_issue", "id", "title", "author", "status", "correspondance", "affiliation_1", "nation_1", "area_1" )
}
###--- corresponding authors for non-corresponding authors from South America ---###
list.corresponding.author.for.non.crsp.sa <- c()
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.new.list <- which( csv_list[i]==list.non.corresponding.author.sa.all[,1] )
  new.list <- c()
  if( length(num.new.list) == 1 ){
    new.list <- t(list.non.corresponding.author.sa.all[num.new.list,])
  } else if( length(num.new.list) > 1 ){
    new.list <- list.non.corresponding.author.sa.all[num.new.list,]
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
      list.corresponding.author.for.non.crsp.sa <- rbind( list.corresponding.author.for.non.crsp.sa,
                                                          new.new.new.list
      )
    }
  }

}
if( !is.null(list.corresponding.author.for.non.crsp.sa) ){
  colnames( list.corresponding.author.for.non.crsp.sa ) <- c( "volume_issue", "id", "title", "author", "status", "correspondance", "affiliation_1", "nation_1", "area_1" )
}
vol.iss <- paste( list.corresponding.author.for.non.crsp.sa[,1], 
                  as.character(list.corresponding.author.for.non.crsp.sa[,2]),
                  sep = "-"
                )
list.corresponding.author.for.non.crsp.sa <- list.corresponding.author.for.non.crsp.sa[ !duplicated( vol.iss ), ]

###--- print ---###
print( paste("the number of non-corresponding author from South America:", 
             as.character( length(list.non.corresponding.author.sa.all[,1]) )
            ) 
      )
print( paste("the number of papers including non-corresponding author from South America:", 
             as.character( length(list.corresponding.author.for.non.crsp.sa[,1]) )
            ) 
      )
num.corresponding.author.w <- length( which( list.corresponding.author.for.non.crsp.sa[,9] != "South America"  ) )
print( paste("Western (Correspo) vs South America (Non-correspo):", 
             as.character( num.corresponding.author.w )
            ) 
      )
list.crsp.other.for.non.crsp.sa <- list.corresponding.author.for.non.crsp.sa[which( list.corresponding.author.for.non.crsp.sa[,9] != "East Asia"  ),]
#View(
#  list.corresponding.author.for.non.crsp.sa[which( list.corresponding.author.for.non.crsp.sa[,9] != "East Asia"  ),]
#)

###--- Non-native (Correspo) vs Native (Non-correspo) ---###
list.crsp.non.native.sa <- c()
which(list.corresponding.author.for.non.crsp.sa[,9] == "South America")
new.list <- list.corresponding.author.for.non.crsp.sa[which(list.corresponding.author.for.non.crsp.sa[,9] == "South America"),]
list.vol.iss <- paste(list.non.corresponding.author.sa.all[,1],
                      as.character(list.non.corresponding.author.sa.all[,2]),sep="-")
for( i in 1:length(new.list[,1]) ){
  vol.iss01 <- paste(new.list[i,1],as.character(new.list[i,2]),sep="-")
  new.new.list <- list.non.corresponding.author.sa.all[which( list.vol.iss==vol.iss01 ),]
  if( length(which( list.vol.iss==vol.iss01 )) == 1 ){
    new.new.list <- t(new.new.list)
  }
  nums <- which( new.new.list[,8]!=new.list[i,8] )
  if( length(nums) > 0 ){
    list.crsp.non.native.sa <- rbind(
      list.crsp.non.native.sa, new.list[i,]
    )
  } 
}

print( paste("Non-native (Correspo) vs Native (Non-correspo):", 
             as.character( length(list.crsp.non.native.sa[,1]) )
            ) 
      )


###--- Native (Correspo) vs Native (Non-correspo) ---###
list.crsp.native.sa <- c()
list.vol.iss01 <- paste(list.crsp.non.native.sa[,1],
                      as.character(list.crsp.non.native.sa[,2]),sep="-")
new.list <- list.corresponding.author.for.non.crsp.sa[which(list.corresponding.author.for.non.crsp.sa[,9] == "South America"),]
list.vol.iss02 <- paste(new.list[,1], as.character(new.list[,2]),sep="-")
list.crsp.native.sa <- rbind( list.crsp.non.native.sa, new.list )[ !duplicated( c( list.vol.iss01, list.vol.iss02 ) ), ]
list.crsp.native.sa <- list.crsp.native.sa[-(1:length(list.vol.iss01)),] 

print( paste("Native (Correspo) vs Native (Non-correspo):", 
             as.character( length(list.crsp.native.sa[,1]) )
            ) 
      )


######################################################################################
###--- corresponding author from South America (do not include non-corresponding author) ---###
######################################################################################
print( "--- ( Corresponding author from South America ) ---" )
list.corresponding.author.sa <- c()
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.list <- c( which(dat$area_1=="South America"), which(dat$correspondance==1) )
  num.corresponding.author.sa <- num.list[duplicated( num.list )]
  len.corresponding.author.sa <- length( num.corresponding.author.sa )
  if( len.corresponding.author.sa > 0 ){
    
    new.list <- cbind(
      rep(csv_list[i],length=len.corresponding.author.sa),
      dat[num.corresponding.author.sa,1],
      dat[num.corresponding.author.sa,]$title,
      dat[num.corresponding.author.sa,]$author,
      dat[num.corresponding.author.sa,]$status,
      dat[num.corresponding.author.sa,]$correspondance,
      dat[num.corresponding.author.sa,]$affiliation_1,
      dat[num.corresponding.author.sa,]$nation_1,
      dat[num.corresponding.author.sa,]$area_1
    )
    list.corresponding.author.sa <- rbind( list.corresponding.author.sa,
                                           new.list
    )
  }
  
}
if( !is.null(list.corresponding.author.sa) ){
  colnames( list.corresponding.author.sa ) <- c( "volume_issue", "id", "title", "author", "status", "correspondance", "affiliation_1", "nation_1", "area_1" )
}

print( paste("the number of papers including corresponding author from South America:", 
             as.character( length(list.corresponding.author.sa[,1]) )
            ) 
      )

###--- South America (Correspo) vs the other (Non-correspo) ---###
list.crsp.only.sa <- c()
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.new.list <- which( csv_list[i]==list.corresponding.author.sa[,1] )
  new.list <- c()
  if( length(num.new.list) == 1 ){
    new.list <- t(list.corresponding.author.sa[num.new.list,])
  } else if( length(num.new.list) > 1 ){
    new.list <- list.corresponding.author.sa[num.new.list,]
  }
  
  if( length(num.new.list) > 0 ){
    
    for ( j in 1:length(num.new.list) ) {

      # issue number & non-corresponding author from except South America
      nums <- c( which( dat[,1]==as.integer(new.list[j,2]) ), which( dat$correspondance==0 ) )
      new.nums <- nums[duplicated( nums )]
      new.new.list <- dat[new.nums,] # issue number

      # nations match
      nums.nums <- which( new.new.list$area_1 == "South America" )
      if( length( nums.nums ) > 0 ){

        new.new.list <- new.new.list[nums.nums,]
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
          list.crsp.only.sa <- rbind( list.crsp.only.sa,
                                      new.new.new.list
          )
        }

      }
    }
  }
  
}
list.vol.iss01 <- paste( list.crsp.only.sa[,1], as.character(list.crsp.only.sa[,2]), sep="-" )
list.crsp.only.sa <- list.crsp.only.sa[!duplicated(list.vol.iss01),]
list.vol.iss01 <- list.vol.iss01[!duplicated(list.vol.iss01)]
list.vol.iss02 <- paste( list.corresponding.author.sa[,1], 
                    as.character(list.corresponding.author.sa[,2]), sep="-" )
list.crsp.only.sa <- rbind( list.crsp.only.sa, list.corresponding.author.sa )[ 
  !duplicated( c( list.vol.iss01, list.vol.iss02 ) ), ]
list.crsp.only.sa <- list.crsp.only.sa[-(1:length(list.vol.iss01)),] 

if( !is.null(list.crsp.only.sa) ){
  colnames( list.crsp.only.sa ) <- c( "volume_issue", "id", "title", "author", "status", "correspondance", "affiliation_1", "nation_1", "area_1" )
}

print( paste( "South America (Correspo) vs the others are Western (Non-correspo): ",
              as.character( length(list.crsp.only.sa[,1]) ) )
       )
