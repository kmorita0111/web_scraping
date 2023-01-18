###--- setting working directory ---###
journal.dir <- "ecology"
wd.name <- paste( paste("~/web_scraping",journal.dir,sep="/"), "result2023_with_nation-1", sep="/" )
setwd( wd.name )

###--- csv list ---###
csv_list <- list.files( pattern = "*.csv" )
len.csv.list <- length( csv_list )

###--- file name & shaping into the same length ---###
filename <- c()
recorder.w.global <- c(); recorder.w.local <- c(); recorder.w.global.all <- c(); recorder.w.local.all <- c()
recorder.w.crsp <- c(); recorder.w.non.crsp <- c()
recorder.w.global <- c(); recorder.w.local <- c(); recorder.w.global.all <- c(); recorder.w.local.all <- c()
recorder.w.crsp <- c(); recorder.w.non.crsp <- c()
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
###--- The number of corresponding authors in Western ---###
##############################################################
print( "======( Western )======" )
######################################################################################
###--- non-corresponding author from Western (do not include corresponding author) ---###
######################################################################################
print( "--- ( Non-corresponding author from Western ) ---" )
list.non.corresponding.author.w.all <- c()
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.list01 <- c( which(dat$area_1=="Oceania"), which(dat$area_1=="Europe"), which(dat$area_1=="North America"), which(dat$status=="middle") )
  num.non.corresponding.author.w01 <- num.list01[duplicated( num.list01 )]
  num.list02 <- c( which(dat$area_1=="Oceania"), which(dat$area_1=="Europe"), which(dat$area_1=="North America"), which(dat$status=="last") )
  num.non.corresponding.author.w02 <- num.list02[duplicated( num.list02 )]
  num.non.corresponding.author.w <- c( num.non.corresponding.author.w01, num.non.corresponding.author.w02 )
  len.non.corresponding.author.w <- length( num.non.corresponding.author.w )
  if( len.non.corresponding.author.w > 0 ){
    
    new.list <- cbind(
      rep(csv_list[i],length=len.non.corresponding.author.w),
      dat[num.non.corresponding.author.w,1],
      dat[num.non.corresponding.author.w,]$title,
      dat[num.non.corresponding.author.w,]$author,
      dat[num.non.corresponding.author.w,]$status,
      dat[num.non.corresponding.author.w,]$correspondance,
      dat[num.non.corresponding.author.w,]$affiliation_1,
      dat[num.non.corresponding.author.w,]$nation_1,
      dat[num.non.corresponding.author.w,]$area_1
    )
    list.non.corresponding.author.w.all <- rbind( list.non.corresponding.author.w.all,
                                                   new.list
    )
  }
  
}
if( !is.null(list.non.corresponding.author.w.all) ){
  colnames( list.non.corresponding.author.w.all ) <- c( "volume_issue", "id", "title", "author", "status", "correspondance", "affiliation", "nation", "area" )
}
###--- corresponding authors for non-corresponding authors from Western ---###
list.corresponding.author.for.non.crsp.w <- c()
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.new.list <- which( csv_list[i]==list.non.corresponding.author.w.all[,1] )
  new.list <- c()
  if( length(num.new.list) == 1 ){
    new.list <- t(list.non.corresponding.author.w.all[num.new.list,])
  } else if( length(num.new.list) > 1 ){
    new.list <- list.non.corresponding.author.w.all[num.new.list,]
  }

  if( length(num.new.list) > 0 ){

    for ( j in 1:length(num.new.list) ) {
      
      # issue number & corresponding author
      nums <- c( which( dat[,1]==as.integer(new.list[j,2]) ), which( dat$status=="first" ) )
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
      list.corresponding.author.for.non.crsp.w <- rbind( list.corresponding.author.for.non.crsp.w,
                                                          new.new.new.list
      )
    }
  }

}
if( !is.null(list.corresponding.author.for.non.crsp.w) ){
  colnames( list.corresponding.author.for.non.crsp.w ) <- c( "volume_issue", "id", "title", "author", "status", "correspondance", "affiliation", "nation", "area" )
}
vol.iss <- paste( list.corresponding.author.for.non.crsp.w[,1], 
                  as.character(list.corresponding.author.for.non.crsp.w[,2]),
                  sep = "-"
                )
list.corresponding.author.for.non.crsp.w <- list.corresponding.author.for.non.crsp.w[ !duplicated( vol.iss ), ]

###--- print ---###
print( paste("the number of non-corresponding author from Western:", 
             as.character( length(list.non.corresponding.author.w.all[,1]) )
            ) 
      )
print( paste("the number of papers including non-corresponding author from Western:", 
             as.character( length(list.corresponding.author.for.non.crsp.w[,1]) )
            ) 
      )
num.all <- length( list.corresponding.author.for.non.crsp.w[,1]  )
num01 <- length( which( list.corresponding.author.for.non.crsp.w[,9] == "North America"  ) )
num02 <- length( which( list.corresponding.author.for.non.crsp.w[,9] == "Europe"  ) )
num03 <- length( which( list.corresponding.author.for.non.crsp.w[,9] == "Oceania"  ) )
num.corresponding.author.w <- num.all - num01 - num02 - num03
print( paste("The other (Correspo) vs western (Non-correspo):", 
             as.character( num.corresponding.author.w )
            ) 
      )

###--- Non-native (Correspo) vs Native (Non-correspo) ---###
list.crsp.non.native.w <- c()
#which(list.corresponding.author.for.non.crsp.w[,9] == "Western")
new.list <- list.corresponding.author.for.non.crsp.w[c(which(list.corresponding.author.for.non.crsp.w[,9] == "North America"),
                                                       which(list.corresponding.author.for.non.crsp.w[,9] == "Europe"),
                                                       which(list.corresponding.author.for.non.crsp.w[,9] == "Oceania")
                                                       ),]
list.vol.iss <- paste(list.non.corresponding.author.w.all[,1],
                      as.character(list.non.corresponding.author.w.all[,2]),sep="-")
for( i in 1:length(new.list[,1]) ){
  vol.iss01 <- paste(new.list[i,1],as.character(new.list[i,2]),sep="-")
  new.new.list <- list.non.corresponding.author.w.all[which( list.vol.iss==vol.iss01 ),]
  if( length(which( list.vol.iss==vol.iss01 )) == 1 ){
    new.new.list <- t(new.new.list)
  }
  nums <- which( new.new.list[,8]!=new.list[i,8] )
  if( length(nums) > 0 ){
    list.crsp.non.native.w <- rbind(
      list.crsp.non.native.w, new.list[i,]
    )
  } 
}

print( paste("Non-native (Correspo) vs Native (Non-correspo):", 
             as.character( length(list.crsp.non.native.w[,1]) )
            ) 
      )


###--- Native (Correspo) vs Native (Non-correspo) ---###
list.crsp.native.w <- c()
list.vol.iss01 <- paste(list.crsp.non.native.w[,1],
                      as.character(list.crsp.non.native.w[,2]),sep="-")
new.list <- list.corresponding.author.for.non.crsp.w[c(which(list.corresponding.author.for.non.crsp.w[,9] == "North America"),
                                                       which(list.corresponding.author.for.non.crsp.w[,9] == "Europe"),
                                                       which(list.corresponding.author.for.non.crsp.w[,9] == "Oceania")
                                                       ),]
list.vol.iss02 <- paste(new.list[,1], as.character(new.list[,2]),sep="-")
list.crsp.native.w <- rbind( list.crsp.non.native.w, new.list )[ !duplicated( c( list.vol.iss01, list.vol.iss02 ) ), ]
list.crsp.native.w <- list.crsp.native.w[-(1:length(list.vol.iss01)),] 

print( paste("Native (Correspo) vs Native (Non-correspo):", 
             as.character( length(list.crsp.native.w[,1]) )
            ) 
      )


#########################################################################################
###--- corresponding author from Western (do not include non-corresponding author) ---###
#########################################################################################
print( "--- ( Corresponding author from Western ) ---" )
list.corresponding.author.w <- c()
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.list <- c( which(dat$area_1=="North America"), 
                 which(dat$area_1=="Europe"), 
                 which(dat$area_1=="Oceania"), which(dat$status=="first") )
  num.corresponding.author.w <- num.list[duplicated( num.list )]
  len.corresponding.author.w <- length( num.corresponding.author.w )
  if( len.corresponding.author.w > 0 ){
    
    new.list <- cbind(
      rep(csv_list[i],length=len.corresponding.author.w),
      dat[num.corresponding.author.w,1],
      dat[num.corresponding.author.w,]$title,
      dat[num.corresponding.author.w,]$author,
      dat[num.corresponding.author.w,]$status,
      dat[num.corresponding.author.w,]$correspondance,
      dat[num.corresponding.author.w,]$affiliation_1,
      dat[num.corresponding.author.w,]$nation_1,
      dat[num.corresponding.author.w,]$area_1
    )
    list.corresponding.author.w <- rbind( list.corresponding.author.w,
                                           new.list
    )
  }
  
}
if( !is.null(list.corresponding.author.w) ){
  colnames( list.corresponding.author.w ) <- c( "volume_issue", "id", "title", "author", "status", "correspondance", "affiliation", "nation", "area" )
}

print( paste("the number of papers including corresponding author from Western:", 
             as.character( length(list.corresponding.author.w[,1]) )
            ) 
      )

###--- Western (Correspo) vs the other (Non-correspo) ---###
list.crsp.only.w <- c()
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.new.list <- which( csv_list[i]==list.corresponding.author.w[,1] )
  new.list <- c()
  if( length(num.new.list) == 1 ){
    new.list <- t(list.corresponding.author.w[num.new.list,])
  } else if( length(num.new.list) > 1 ){
    new.list <- list.corresponding.author.w[num.new.list,]
  }
  
  if( length(num.new.list) > 0 ){
    
    for ( j in 1:length(num.new.list) ) {

      # issue number & non-corresponding author from except Western
      nums01 <- c( which( dat[,1]==as.integer(new.list[j,2]) ), which( dat$status=="middle" ) )
      new.nums01 <- nums01[duplicated( nums01 )]
      nums02 <- c( which( dat[,1]==as.integer(new.list[j,2]) ), which( dat$status=="last" ) )
      new.nums02 <- nums02[duplicated( nums02 )]
      new.nums <- c( new.nums01, new.nums02 )
      new.new.list <- dat[new.nums,] # issue number

      # nations match
      nums.nums <- c( which( new.new.list$area_1 == "North America" ), 
                      which( new.new.list$area_1 == "Europe" ), 
                      which( new.new.list$area_1 == "Oceania" )
                      )
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
          list.crsp.only.w <- rbind( list.crsp.only.w,
                                      new.new.new.list
          )
        }

      }
    }
  }
  
}
list.vol.iss01 <- paste( list.crsp.only.w[,1], as.character(list.crsp.only.w[,2]), sep="-" )
list.crsp.only.w <- list.crsp.only.w[!duplicated(list.vol.iss01),]
list.vol.iss01 <- list.vol.iss01[!duplicated(list.vol.iss01)]
list.vol.iss02 <- paste( list.corresponding.author.w[,1], 
                    as.character(list.corresponding.author.w[,2]), sep="-" )
list.crsp.only.w <- rbind( list.crsp.only.w, list.corresponding.author.w )[ 
  !duplicated( c( list.vol.iss01, list.vol.iss02 ) ), ]
list.crsp.only.w <- list.crsp.only.w[-(1:length(list.vol.iss01)),] 

if( !is.null(list.crsp.only.w) ){
  colnames( list.crsp.only.w ) <- c( "volume_issue", "id", "title", "author", "status", "correspondance", "affiliation", "nation", "area" )
}
print( paste( "Western (Correspo) vs the others are Western (Non-correspo): ",
              as.character( length(list.crsp.only.w[,1]) ) )
       )
