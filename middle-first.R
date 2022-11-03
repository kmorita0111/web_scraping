###--- setting working directory ---###
journal.dir <- "ecology"
wd.name <- paste( paste("~/web_scraping",journal.dir,sep="/"), "result_with_nation", sep="/" )
setwd( wd.name )

###--- csv list ---###
csv_list <- list.files( pattern = "*.csv" )
len.csv.list <- length( csv_list )
###--- file name & shaping into the same length ---###
filename <- c()
recorder.ea.global <- c(); recorder.ea.local <- c()
recorder.af.global <- c(); recorder.af.local <- c()
recorder.sa.global <- c(); recorder.sa.local <- c()

###--- The number of first authors in East Asia ---###
count.first.ea <- 0
for ( i in 1:len.csv.list ) { #
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  len.area <- length( dat$area )
  for ( j in 1:len.area ) {
    if( dat$area[j] == "East Asia" && dat$status[j] == "first" ) count.first.ea <- count.first.ea + 1
  }
}
print( paste( "The number of first authors in East Asia =", as.character(count.first.ea) ) )

###--- East Asia vs Western ---###
for ( i in 1:len.csv.list ) {
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  len.area <- length( dat$area )
  prev.num <- -1
  
  for ( j in 1:len.area ) {
    if( dat$area[j] == "East Asia" && dat$status[j] == "middle" ){
      for ( k in (j-1):1 ){
        if( dat$area[k] != "East Asia" && dat$status[k] == "first" ){
          if( prev.num != dat[j,1] ){
            recorder.ea.global <- rbind( recorder.ea.global,
                                         c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[k], dat$area[j], dat$nation[k], dat$nation[j] ) 
                                        )
            prev.num <- dat[j,1]
            break
          }
        }
      }
    }
  }

}
if( !is.null( recorder.ea.global ) ) colnames( recorder.ea.global ) <- c( "Volume", "Article", "Title", "First (Area)", "Middle (Area)", "First (Nation)", "Middle (Nation)" )

###--- East Asia, developing vs advanced ---###
for ( i in 1:len.csv.list ) { #
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  len.area <- length( dat$area )
  prev.num <- -1
  
  ## local
  for ( j in 1:len.area ) {
    if( dat$area[j] == "East Asia" && dat$status[j] == "middle" ){
      for ( k in (j-1):1 ){
        if( dat$area[k] == "East Asia" && dat$status[k] == "first" ){
          if( dat$nation[k] != dat$nation[j] ){
            if( prev.num != dat[j,1] ){
              recorder.ea.local <- rbind( recorder.ea.local,
                                          c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$nation[k], dat$nation[j] ) 
              )
              prev.num <- dat[j,1]
              break
            }
          }
        }
      }
    }
  }
  
  
}
if( !is.null( recorder.ea.local ) ) colnames( recorder.ea.local ) <- c( "Volume", "Article", "Title", "First", "Middle" )

###--- The number of first authors in Africa ---###
count.first.af <- 0
for ( i in 1:len.csv.list ) { #
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  len.area <- length( dat$area )
  for ( j in 1:len.area ) {
    if( dat$area[j] == "Africa" && dat$status[j] == "first" ) count.first.af <- count.first.af + 1
  }
}
print( paste( "The number of first authors in Africa =", as.character(count.first.af) ) )

###--- Africa vs Western ---###
for ( i in 1:len.csv.list ) { #
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  len.area <- length( dat$area )
  prev.num <- -1
  
  for ( j in 1:len.area ) {
    if( dat$area[j] == "Africa" && dat$status[j] == "middle" ){
      for ( k in (j-1):1 ){
        if( dat$area[k] != "Africa" && dat$status[k] == "first" ){
          if( prev.num != dat[j,1] ){
            recorder.af.global <- rbind( recorder.af.global,
                                         c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[k], dat$area[j], dat$nation[k], dat$nation[j] ) 
            )
            prev.num <- dat[j,1]
            break
          }
        }
      }
    }
  }
  
}
if( !is.null( recorder.af.global ) ) colnames( recorder.af.global ) <- c( "Volume", "Article", "Title", "First (Area)", "Middle (Area)", "First (Nation)", "Middle (Nation)" )

###--- Africa, developing vs advanced ---###
for ( i in 1:len.csv.list ) { #
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  len.area <- length( dat$area )
  prev.num <- -1
  
  ## local
  for ( j in 1:len.area ) {
    if( dat$area[j] == "Africa" && dat$status[j] == "middle" ){
      for ( k in (j-1):1 ){
        if( dat$area[k] == "Africa" && dat$status[k] == "first" ){
          if( dat$nation[k] != dat$nation[j] ){
            if( prev.num != dat[j,1] ){
              recorder.af.local <- rbind( recorder.af.local,
                                          c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$nation[k], dat$nation[j] ) 
              )
              prev.num <- dat[j,1]
              break
            }
          }
        }
      }
    }
  }
  
  
}
if( !is.null( recorder.af.local ) ) colnames( recorder.af.local ) <- c( "Volume", "Article", "Title", "First", "Middle" )

###--- The number of first authors in South America ---###
count.first.af <- 0
for ( i in 1:len.csv.list ) { #
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  len.area <- length( dat$area )
  for ( j in 1:len.area ) {
    if( dat$area[j] == "South America" && dat$status[j] == "first" ) count.first.af <- count.first.af + 1
  }
}
print( paste( "The number of first authors in South America =", as.character(count.first.af) ) )

###--- South America vs Western ---###
for ( i in 1:len.csv.list ) { #
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  len.area <- length( dat$area )
  prev.num <- -1
  
  for ( j in 1:len.area ) {
    if( dat$area[j] == "South America" && dat$status[j] == "middle" ){
      for ( k in (j-1):1 ){
        if( dat$area[k] != "South America" && dat$status[k] == "first" ){
          if( prev.num != dat[j,1] ){
            recorder.sa.global <- rbind( recorder.sa.global,
                                         c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[k], dat$area[j], dat$nation[k], dat$nation[j] ) 
            )
            prev.num <- dat[j,1]
            break
          }
        }
      }
    }
  }
  
}
if( !is.null( recorder.sa.global ) ) colnames( recorder.sa.global ) <- c( "Volume", "Article", "Title", "First (Area)", "Middle (Area)", "First (Nation)", "Middle (Nation)" )

###--- South America, developing vs advanced ---###
for ( i in 1:len.csv.list ) { #
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  len.area <- length( dat$area )
  prev.num <- -1
  
  ## local
  for ( j in 1:len.area ) {
    if( dat$area[j] == "South America" && dat$status[j] == "middle" ){
      for ( k in (j-1):1 ){
        if( dat$area[k] == "South America" && dat$status[k] == "first" ){
          if( dat$nation[k] != dat$nation[j] ){
            if( prev.num != dat[j,1] ){
              recorder.sa.local <- rbind( recorder.sa.local,
                                          c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$nation[k], dat$nation[j] ) 
              )
              prev.num <- dat[j,1]
              break
            }
          }
        }
      }
    }
  }
  
  
}
if( !is.null( recorder.sa.local ) ) colnames( recorder.sa.local ) <- c( "Volume", "Article", "Title", "First", "Middle" )
