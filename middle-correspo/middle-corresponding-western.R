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
num.all.author <- 0
for ( i in 1:len.csv.list ) {
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  num.all.paper <- num.all.paper + dat[length(dat[,1]),1]+1
  num.all.author <- num.all.author + length(dat[,1])
  
}
print( paste( "The sum of all papers =", as.character(num.all.paper) ) )
print( paste( "The sum of all authors =", as.character(num.all.author) ) )

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
  num.list <- c( which(dat$area_1=="Oceania"), which(dat$area_1=="Europe"), which(dat$area_1=="North America"), which(dat$correspondance==0) )
  num.non.corresponding.author.w <- num.list[duplicated( num.list )]
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

###--- all the non-corresponding authors are from Western ---###
#list.crsp.non.native.w <- c()
#list.crsp.native.w <- c()
#list.crsp.native.non.crsp.native.w <- c()
#for ( i in 1:len.csv.list ) {
#  
#  dat <- read.csv( csv_list[i] )
#  num.author <- length( dat[,1] )
#  id.last <- dat[num.author,1]
#  
#  for ( id.num in 0:id.last ) {
#    # all authors
#    #if( length( which(dat[,1] == id.num) ) == 1 ){ temp.list <- t(dat[which(dat[,1] == id.num),]) 
#    #} else if( length( which(dat[,1] == id.num) ) > 1 ){ temp.list <- dat[which(dat[,1] == id.num),]
#    #} 
#    temp.list <- dat[which(dat[,1] == id.num),]
#    num.author.all <- length( temp.list[,1] )
#    # non-corresponding author
#    temps <- c( which(temp.list$correspondance == 0), 
#                which(temp.list$area_1 == "North America"), 
#                which(temp.list$area_1 == "Europe"), 
#                which(temp.list$area_1 == "Oceania")
#              )
#    num.non.crsp <- temps[duplicated(temps)]
#    num.author.non.crsp <- length( num.non.crsp )
#
#    if( num.author.non.crsp == (num.author.all-1) && num.author.non.crsp > 0 ){
#      temp.list.1 <- temp.list[num.non.crsp,]
#      colnames( temp.list.1 ) <- NULL
#      #if( num.author.non.crsp == 1 ){ temp.list.1 <- t(temp.list.1) }
#      list.crsp.native.non.crsp.native.w <- rbind( list.crsp.native.non.crsp.native.w, 
#                                                   cbind( rep(csv_list[i],length=num.author.non.crsp), temp.list.1 )
#                                                  )
#      
#      ### corresponding author from Western  ###
#      temps <- c( which(temp.list$correspondance == 1), 
#                  which(temp.list$area_1 == "North America"), 
#                  which(temp.list$area_1 == "Europe"), 
#                  which(temp.list$area_1 == "Oceania")
#                )
#      num.crsp <- temps[duplicated(temps)]
#      num.author.crsp <- length( num.crsp )
#      
#      if( num.author.crsp > 0 ){
#        temp.list.1 <- temp.list[num.crsp,]
#        colnames( temp.list.1 ) <- NULL
#        list.crsp.native.w <- rbind( list.crsp.native.w, 
#                                     cbind( csv_list[i], temp.list.1 )
#                                    )
#      }
#      ### corresponding author from non-Western  ###
#      else if( num.author.crsp == 0 ){
#        temp.list.1 <- temp.list[which(temp.list$correspondance == 1),]
#        colnames( temp.list.1 ) <- NULL
#        list.crsp.non.native.w <- rbind( list.crsp.non.native.w, 
#                                         cbind( csv_list[i], temp.list.1 )
#                                        )
#      }
#      
#      
#    }
#  }
#  
#}
#length( list.crsp.native.w[,1] )

#########################################################################################
###--- corresponding author from Western (do not include non-corresponding author) ---###
#########################################################################################
print( "--- ( Corresponding author from Western ) ---" )
list.corresponding.author.w <- c()
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.list <- c( which(dat$area_1=="North America"), 
                 which(dat$area_1=="Europe"), 
                 which(dat$area_1=="Oceania"), which(dat$correspondance==1) )
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
      nums <- c( which( dat[,1]==as.integer(new.list[j,2]) ), which( dat$correspondance==0 ) )
      new.nums <- nums[duplicated( nums )]
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
