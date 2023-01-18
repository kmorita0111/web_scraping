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
###--- The number of corresponding authors in East Asia ---###
##############################################################
print( "======( East Asia )======" )
######################################################################################
###--- non-corresponding author from Asia (do not include corresponding author) ---###
######################################################################################
print( "--- ( Non-corresponding author from Asia ) ---" )
list.non.corresponding.author.ea.all <- c()
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.list01 <- c( which(dat$area_1=="East Asia"), which(dat$status=="middle") )
  num.non.corresponding.author.ea01 <- num.list01[duplicated( num.list01 )]
  num.list02 <- c( which(dat$area_1=="East Asia"), which(dat$status=="last") )
  num.non.corresponding.author.ea02 <- num.list02[duplicated( num.list02 )]
  num.non.corresponding.author.ea <- c( num.non.corresponding.author.ea01, num.non.corresponding.author.ea02 )
  len.non.corresponding.author.ea <- length( num.non.corresponding.author.ea )
  if( len.non.corresponding.author.ea > 0 ){
    
    new.list <- cbind(
      rep(csv_list[i],length=len.non.corresponding.author.ea),
      dat[num.non.corresponding.author.ea,1],
      dat[num.non.corresponding.author.ea,]$title,
      dat[num.non.corresponding.author.ea,]$author,
      dat[num.non.corresponding.author.ea,]$status,
      dat[num.non.corresponding.author.ea,]$correspondance,
      dat[num.non.corresponding.author.ea,]$affiliation_1,
      dat[num.non.corresponding.author.ea,]$nation_1,
      dat[num.non.corresponding.author.ea,]$area_1
    )
    list.non.corresponding.author.ea.all <- rbind( list.non.corresponding.author.ea.all,
                                                   new.list
    )
  }
  
}
if( !is.null(list.non.corresponding.author.ea.all) ){
  colnames( list.non.corresponding.author.ea.all ) <- c( "volume_issue", "id", "title", "author", "status", "correspondance", "affiliation_1", "nation_1", "area_1" )
}
###--- corresponding authors for non-corresponding authors from Asia ---###
list.corresponding.author.for.non.crsp.ea <- c()
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.new.list <- which( csv_list[i]==list.non.corresponding.author.ea.all[,1] )
  new.list <- c()
  if( length(num.new.list) == 1 ){
    new.list <- t(list.non.corresponding.author.ea.all[num.new.list,])
  } else if( length(num.new.list) > 1 ){
    new.list <- list.non.corresponding.author.ea.all[num.new.list,]
  }

  if( length(num.new.list) > 0 ){
    
    for ( j in 1:length(num.new.list) ) {
      
      # issue number & corresponding author
      nums <- c( which( dat[,1]==as.integer(new.list[j,2]) ), which( dat$status=="first" ) )
      #print( nums )
      new.nums <- nums[duplicated( nums )]
      new.new.list <- dat[new.nums,] # issue number

      new.new.new.list <- c()
      if( length(new.new.list[,1]) > 0 ){
        #print( "hoge" )
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
      list.corresponding.author.for.non.crsp.ea <- rbind( list.corresponding.author.for.non.crsp.ea,
                                                          new.new.new.list
      )
    }
  }

}
if( !is.null(list.corresponding.author.for.non.crsp.ea) ){
  colnames( list.corresponding.author.for.non.crsp.ea ) <- c( "volume_issue", "id", "title", "author", "status", "correspondance", "affiliation_1", "nation_1", "area_1" )
}
vol.iss <- paste( list.corresponding.author.for.non.crsp.ea[,1], 
                  as.character(list.corresponding.author.for.non.crsp.ea[,2]),
                  sep = "-"
                )
list.corresponding.author.for.non.crsp.ea <- list.corresponding.author.for.non.crsp.ea[ !duplicated( vol.iss ), ]

###--- print ---###
print( paste("the number of non-corresponding author from Asia:", 
             as.character( length(list.non.corresponding.author.ea.all[,1]) )
            ) 
      )
print( paste("the number of papers including non-corresponding author from Asia:", 
             as.character( length(list.corresponding.author.for.non.crsp.ea[,1]) )
            ) 
      )

###--- Western (Correspo) vs Asia (Non-correspo) ---###
##-- corresponding author --##
num.corresponding.author.w <- length( which( list.corresponding.author.for.non.crsp.ea[,9] != "East Asia"  ) )
print( paste("Western (Correspo) vs Asia (Non-correspo):", 
             as.character( num.corresponding.author.w )
            ) 
      )
list.crsp.other.for.non.crsp.ea <- list.corresponding.author.for.non.crsp.ea[which( list.corresponding.author.for.non.crsp.ea[,9] != "East Asia"  ),]

##-- non-corresponding author --##
list.non.crsp.author.ea.crsp.other <- c()
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.new.list <- which( csv_list[i]==list.crsp.other.for.non.crsp.ea[,1] )
  new.list <- c()
  if( length(num.new.list) == 1 ){
    new.list <- t(list.crsp.other.for.non.crsp.ea[num.new.list,])
  } else if( length(num.new.list) > 1 ){
    new.list <- list.crsp.other.for.non.crsp.ea[num.new.list,]
  }
  
  if( length(num.new.list) > 0 ){
    
    for ( j in 1:length(num.new.list) ) {
      
      # issue number & corresponding author
      nums01 <- c( which( dat[,1]==as.integer(new.list[j,2]) ), which( dat$status=="middle" ) )
      new.nums01 <- nums01[duplicated( nums01 )]
      nums02 <- c( which( dat[,1]==as.integer(new.list[j,2]) ), which( dat$status=="last" ) )
      new.nums02 <- nums02[duplicated( nums02 )]
      new.nums <- c( new.nums01, new.nums02 )
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
      list.non.crsp.author.ea.crsp.other <- rbind( list.non.crsp.author.ea.crsp.other,
                                                  new.new.new.list
      )
    }
  }
  
}
if( !is.null(list.non.crsp.author.ea.crsp.other) ){
  colnames( list.non.crsp.author.ea.crsp.other ) <- c( "volume_issue", "id", "title", "author", "status", "correspondance", "affiliation_1", "nation_1", "area_1" )
}

###--- Non-native (Correspo) vs Native (Non-correspo) ---###
##-- corresponding author --##
list.crsp.non.native.ea <- c()
which(list.corresponding.author.for.non.crsp.ea[,9] == "East Asia")
new.list <- list.corresponding.author.for.non.crsp.ea[which(list.corresponding.author.for.non.crsp.ea[,9] == "East Asia"),]
list.vol.iss <- paste(list.non.corresponding.author.ea.all[,1],
                      as.character(list.non.corresponding.author.ea.all[,2]),sep="-")
for( i in 1:length(new.list[,1]) ){
  vol.iss01 <- paste(new.list[i,1],as.character(new.list[i,2]),sep="-")
  new.new.list <- list.non.corresponding.author.ea.all[which( list.vol.iss==vol.iss01 ),]
  if( length(which( list.vol.iss==vol.iss01 )) == 1 ){
    new.new.list <- t(new.new.list)
  }
  nums <- which( new.new.list[,8]!=new.list[i,8] )
  if( length(nums) > 0 ){
    list.crsp.non.native.ea <- rbind(
      list.crsp.non.native.ea, new.list[i,]
    )
  } 
}

print( paste("Non-native (Correspo) vs Native (Non-correspo):", 
             as.character( length(list.crsp.non.native.ea[,1]) )
            ) 
      )
##-- non-corresponding author --##
list.non.crsp.author.ea.crsp.non.native <- c()
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.new.list <- which( csv_list[i]==list.crsp.non.native.ea[,1] )
  new.list <- c()
  if( length(num.new.list) == 1 ){
    new.list <- t(list.crsp.non.native.ea[num.new.list,])
  } else if( length(num.new.list) > 1 ){
    new.list <- list.crsp.non.native.ea[num.new.list,]
  }
  
  if( length(num.new.list) > 0 ){
    
    for ( j in 1:length(num.new.list) ) {
      
      # issue number & corresponding author
      nums01 <- c( which( dat[,1]==as.integer(new.list[j,2]) ), which( dat$status=="middle" ) )
      new.nums01 <- nums01[duplicated( nums01 )]
      nums02 <- c( which( dat[,1]==as.integer(new.list[j,2]) ), which( dat$status=="last" ) )
      new.nums02 <- nums02[duplicated( nums02 )]
      new.nums <- c( new.nums01, new.nums02 )
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
      list.non.crsp.author.ea.crsp.non.native <- rbind( list.non.crsp.author.ea.crsp.non.native,
                                                        new.new.new.list
      )
    }
  }
  
}
if( !is.null(list.non.crsp.author.ea.crsp.non.native) ){
  colnames( list.non.crsp.author.ea.crsp.non.native ) <- c( "volume_issue", "id", "title", "author", "status", "correspondance", "affiliation_1", "nation_1", "area_1" )
}

###--- Native (Correspo) vs Native (Non-correspo) ---###
##-- corresponding author --##
list.crsp.native.ea <- c()
list.vol.iss01 <- paste(list.crsp.non.native.ea[,1],
                      as.character(list.crsp.non.native.ea[,2]),sep="-")
new.list <- list.corresponding.author.for.non.crsp.ea[which(list.corresponding.author.for.non.crsp.ea[,9] == "East Asia"),]
list.vol.iss02 <- paste(new.list[,1], as.character(new.list[,2]),sep="-")
list.crsp.native.ea <- rbind( list.crsp.non.native.ea, new.list )[ !duplicated( c( list.vol.iss01, list.vol.iss02 ) ), ]
list.crsp.native.ea <- list.crsp.native.ea[-(1:length(list.vol.iss01)),] 

print( paste("Native (Correspo) vs Native (Non-correspo):", 
             as.character( length(list.crsp.native.ea[,1]) )
            ) 
      )
##-- non-corresponding author --##
list.crsp.author.ea.crsp.non.native <- c()
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.new.list <- which( csv_list[i]==list.crsp.native.ea[,1] )
  new.list <- c()
  if( length(num.new.list) == 1 ){
    new.list <- t(list.crsp.native.ea[num.new.list,])
  } else if( length(num.new.list) > 1 ){
    new.list <- list.crsp.native.ea[num.new.list,]
  }
  
  if( length(num.new.list) > 0 ){
    
    for ( j in 1:length(num.new.list) ) {
      
      # issue number & corresponding author
      nums01 <- c( which( dat[,1]==as.integer(new.list[j,2]) ), which( dat$stauts=="middle" ) )
      new.nums01 <- nums01[duplicated( nums01 )]
      nums02 <- c( which( dat[,1]==as.integer(new.list[j,2]) ), which( dat$stauts=="last" ) )
      new.nums02 <- nums02[duplicated( nums02 )]
      new.nums <- c( new.nums01, new.nums02 )
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
      list.crsp.author.ea.crsp.non.native <- rbind( list.crsp.author.ea.crsp.non.native,
                                                    new.new.new.list
      )
    }
  }
  
}
if( !is.null(list.crsp.author.ea.crsp.non.native) ){
  colnames( list.crsp.author.ea.crsp.non.native ) <- c( "volume_issue", "id", "title", "author", "status", "correspondance", "affiliation_1", "nation_1", "area_1" )
}


######################################################################################
###--- corresponding author from Asia (do not include non-corresponding author) ---###
######################################################################################
print( "--- ( Corresponding author from Asia ) ---" )
##-- corresponding author --##
list.corresponding.author.ea <- c()
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.list <- c( which(dat$area_1=="East Asia"), which(dat$status=="first") )
  num.corresponding.author.ea <- num.list[duplicated( num.list )]
  len.corresponding.author.ea <- length( num.corresponding.author.ea )
  if( len.corresponding.author.ea > 0 ){
    
    new.list <- cbind(
      rep(csv_list[i],length=len.corresponding.author.ea),
      dat[num.corresponding.author.ea,1],
      dat[num.corresponding.author.ea,]$title,
      dat[num.corresponding.author.ea,]$author,
      dat[num.corresponding.author.ea,]$status,
      dat[num.corresponding.author.ea,]$correspondance,
      dat[num.corresponding.author.ea,]$affiliation_1,
      dat[num.corresponding.author.ea,]$nation_1,
      dat[num.corresponding.author.ea,]$area_1
    )
    list.corresponding.author.ea <- rbind( list.corresponding.author.ea,
                                           new.list
    )
  }
  
}
if( !is.null(list.corresponding.author.ea) ){
  colnames( list.corresponding.author.ea ) <- c( "volume_issue", "id", "title", "author", "status", "correspondance", "affiliation_1", "nation_1", "area_1" )
}

print( paste("the number of papers including corresponding author from Asia:", 
             as.character( length(list.corresponding.author.ea[,1]) )
            ) 
      )

##-- non-corresponding author --##
list.non.correspo.other.crsp.ea <- c()
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.new.list <- which( csv_list[i]==list.corresponding.author.ea[,1] )
  new.list <- c()
  if( length(num.new.list) == 1 ){
    new.list <- t(list.corresponding.author.ea[num.new.list,])
  } else if( length(num.new.list) > 1 ){
    new.list <- list.corresponding.author.ea[num.new.list,]
  }
  
  if( length(num.new.list) > 0 ){
    
    for ( j in 1:length(num.new.list) ) {
      
      # issue number & corresponding author
      nums01 <- c( which( dat[,1]==as.integer(new.list[j,2]) ), which( dat$status=="middle" ) )
      new.nums01 <- nums01[duplicated( nums01 )]
      nums02 <- c( which( dat[,1]==as.integer(new.list[j,2]) ), which( dat$status=="last" ) )
      new.nums02 <- nums02[duplicated( nums02 )]
      new.nums <- c( new.nums01, new.nums02 )
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
      list.non.correspo.other.crsp.ea <- rbind( list.non.correspo.other.crsp.ea,
                                                new.new.new.list
      )
    }
  }
  
}
if( !is.null(list.non.correspo.other.crsp.ea) ){
  colnames( list.non.correspo.other.crsp.ea ) <- c( "volume_issue", "id", "title", "author", "status", "correspondance", "affiliation_1", "nation_1", "area_1" )
}


###--- Asia (Correspo) vs the other (Non-correspo) ---###
##-- corresponding author --##
list.crsp.only.ea <- c()
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.new.list <- which( csv_list[i]==list.corresponding.author.ea[,1] )
  new.list <- c()
  if( length(num.new.list) == 1 ){
    new.list <- t(list.corresponding.author.ea[num.new.list,])
  } else if( length(num.new.list) > 1 ){
    new.list <- list.corresponding.author.ea[num.new.list,]
  }
  
  if( length(num.new.list) > 0 ){
    
    for ( j in 1:length(num.new.list) ) {

      # issue number & non-corresponding author from except Asia
      nums01 <- c( which( dat[,1]==as.integer(new.list[j,2]) ), which( dat$status=="middle" ) )
      new.nums01 <- nums01[duplicated( nums01 )]
      nums02 <- c( which( dat[,1]==as.integer(new.list[j,2]) ), which( dat$status=="last" ) )
      new.nums02 <- nums02[duplicated( nums02 )]
      new.nums <- c( new.nums01, new.nums02 )
      new.new.list <- dat[new.nums,] # issue number

      # nations match
      nums.nums <- which( new.new.list$area_1 == "East Asia" )
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
          list.crsp.only.ea <- rbind( list.crsp.only.ea,
                                      new.new.new.list
          )
        }

      }
    }
  }
  
}
list.vol.iss01 <- paste( list.crsp.only.ea[,1], as.character(list.crsp.only.ea[,2]), sep="-" )
list.crsp.only.ea <- list.crsp.only.ea[!duplicated(list.vol.iss01),]
list.vol.iss01 <- list.vol.iss01[!duplicated(list.vol.iss01)]
list.vol.iss02 <- paste( list.corresponding.author.ea[,1], 
                    as.character(list.corresponding.author.ea[,2]), sep="-" )
list.crsp.only.ea <- rbind( list.crsp.only.ea, list.corresponding.author.ea )[ 
  !duplicated( c( list.vol.iss01, list.vol.iss02 ) ), ]
list.crsp.only.ea <- list.crsp.only.ea[-(1:length(list.vol.iss01)),] 

if( !is.null(list.crsp.only.ea) ){
  colnames( list.crsp.only.ea ) <- c( "volume_issue", "id", "title", "author", "status", "correspondance", "affiliation_1", "nation_1", "area_1" )
}

print( paste( "Asia (Correspo) vs the others are Western (Non-correspo): ",
              as.character( length(list.crsp.only.ea[,1]) ) )
       )

##-- non-corresponding author --##
list.non.correspo.other.crsp.only.ea <- c()
for ( i in 1:len.csv.list ) {
  
  dat <- read.csv( csv_list[i] )
  num.new.list <- which( csv_list[i]==list.crsp.only.ea[,1] )
  new.list <- c()
  if( length(num.new.list) == 1 ){
    new.list <- t(list.crsp.only.ea[num.new.list,])
  } else if( length(num.new.list) > 1 ){
    new.list <- list.crsp.only.ea[num.new.list,]
  }
  
  if( length(num.new.list) > 0 ){
    
    for ( j in 1:length(num.new.list) ) {
      
      # issue number & corresponding author
      nums01 <- c( which( dat[,1]==as.integer(new.list[j,2]) ), which( dat$status=="middle" ) )
      new.nums01 <- nums01[duplicated( nums01 )]
      nums02 <- c( which( dat[,1]==as.integer(new.list[j,2]) ), which( dat$status=="last" ) )
      new.nums02 <- nums02[duplicated( nums02 )]
      new.nums <- c( new.nums01, new.nums02 )
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
      list.non.correspo.other.crsp.only.ea <- rbind( list.non.correspo.other.crsp.only.ea,
                                                     new.new.new.list
      )
    }
  }
  
}
if( !is.null(list.non.correspo.other.crsp.only.ea) ){
  colnames( list.non.correspo.other.crsp.only.ea ) <- c( "volume_issue", "id", "title", "author", "status", "correspondance", "affiliation_1", "nation_1", "area_1" )
}
