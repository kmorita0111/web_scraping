###--- setting working directory ---###
journal.dir <- "ecology"
wd.name <- paste( paste("~/web_scraping",journal.dir,sep="/"), "result_with_nation", sep="/" )
setwd( wd.name )

###--- csv list ---###
csv_list <- list.files( pattern = "*.csv" )
len.csv.list <- length( csv_list )
###--- file name & shaping into the same length ---###
filename <- c()
recorder.ea.global <- c(); recorder.ea.local <- c(); recorder.ea.global.all <- c(); recorder.ea.local.all <- c()
recorder.af.global <- c(); recorder.af.local <- c(); recorder.af.global.all <- c(); recorder.af.local.all <- c()
recorder.sa.global <- c(); recorder.sa.local <- c(); recorder.sa.global.all <- c(); recorder.sa.local.all <- c()

###--- The number of first authors in East Asia ---###
count.first.ea <- 0
count.middle.ea <- 0

for ( i in 1:len.csv.list ) {
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  prev.num.first <- -1
  prev.num.middle <- -1
  
  len.area <- length( dat$area )
  for ( j in 1:len.area ) {
    if( dat$area[j] == "East Asia" && dat$status[j] == "first" ){
      if( prev.num.first != dat[j,1] ){
        count.first.ea <- count.first.ea + 1
        prev.num.first <- dat[j,1]
      }
    }
  }
  
  for ( j in 1:len.area ) {
    if( dat$area[j] == "East Asia" && dat$status[j] == "middle" ){
      if( prev.num.middle != dat[j,1] ){
        count.middle.ea <- count.middle.ea + 1
        prev.num.middle <- dat[j,1]
      }
    }
  }
  
}
print( paste( "The number of papers including first authors in East Asia =", as.character(count.first.ea) ) )
print( paste( "The number of papers including middle authors in East Asia =", as.character(count.middle.ea) ) )

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
        if( dat$status[k] == "first" ){
          if( dat$area[k] == "East Asia" ){ break }
          else if( dat$area[k] != "East Asia" ){
            if( prev.num != dat[j,1] ){
              recorder.ea.global <- rbind( recorder.ea.global,
                                           c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[k], dat$area[j], dat$nation[k], dat$nation[j], dat$author[k], dat$author[j] ) 
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
if( !is.null( recorder.ea.global ) ) colnames( recorder.ea.global ) <- c( "Volume", "Article", "Title", "First (Area)", "Middle (Area)", "First (Nation)", "Middle (Nation)", "First (Name)", "Middle (Name)" )
print( paste( "East Asia vs Western:", as.character( length(recorder.ea.global[,1]) ) ) )

###--- East Asia vs Western (all authors) ---###
for ( i in 1:len.csv.list ) {
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  len.area <- length( dat$area )

  for ( j in 1:len.area ) {
    if( dat$area[j] == "East Asia" && dat$status[j] == "middle" ){
      for ( k in (j-1):1 ){
        if( dat$status[k] == "first" ){
          if( dat$area[k] == "East Asia" ){ break }
          else if( dat$area[k] != "East Asia" ){
            recorder.ea.global.all <- rbind( recorder.ea.global.all,
                                         c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[k], dat$area[j], dat$nation[k], dat$nation[j], dat$author[k], dat$author[j] ) 
            )
            break
          }
        }
      }
    }
  }

}
if( !is.null( recorder.ea.global.all ) ) colnames( recorder.ea.global.all ) <- c( "Volume", "Article", "Title", "First (Area)", "Middle (Area)", "First (Nation)", "Middle (Nation)", "First (Name)", "Middle (Name)" )
print( paste( "East Asia vs Western (all authors):", as.character( length(recorder.ea.global.all[,1]) ) ) )

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
        if( dat$status[k] == "first" ){
          if( dat$area[k] != "East Asia" ){ break }
          else if( dat$area[k] == "East Asia" ){
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
  
}
if( !is.null( recorder.ea.local ) ) colnames( recorder.ea.local ) <- c( "Volume", "Article", "Title", "First (Nation)", "Middle (Nation)" )
print( paste( "East Asia, developing vs advanced:", as.character( length(recorder.ea.local[,1]) ) ) )

###--- The number of first authors in Africa ---###
count.first.af <- 0
count.middle.af <- 0

for ( i in 1:len.csv.list ) { #
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  prev.num.first <- -1
  prev.num.middle <- -1
  
  len.area <- length( dat$area )
  for ( j in 1:len.area ) {
    if( dat$area[j] == "Africa" && dat$status[j] == "first" ){
      if( prev.num.first != dat[j,1] ){
        count.first.af <- count.first.af + 1
        prev.num.first <- dat[j,1]
      }
    }
  }
  
  for ( j in 1:len.area ) {
    if( dat$area[j] == "Africa" && dat$status[j] == "middle" ){
      if( prev.num.middle != dat[j,1] ){
        count.middle.af <- count.middle.af + 1
        prev.num.middle <- dat[j,1]
      }
    }
  }
  
}
print( paste( "The number of papers including first authors from Africa =", as.character(count.first.af) ) )
print( paste( "The number of papers including middle authors from Africa =", as.character(count.middle.af) ) )

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
        if( dat$status[k] == "first" ){
          if( dat$area[k] == "Africa" ){ break }
          else if( dat$area[k] != "Africa" ){
            if( prev.num != dat[j,1] ){
              recorder.af.global <- rbind( recorder.af.global,
                                           c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[k], dat$area[j], dat$nation[k], dat$nation[j], dat$author[k], dat$author[j] ) 
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
if( !is.null( recorder.af.global ) ) colnames( recorder.af.global ) <- c( "Volume", "Article", "Title", "First (Area)", "Middle (Area)", "First (Nation)", "Middle (Nation)", "First (Name)", "Middle (Name)" )
print( paste( "Africa vs Western:", as.character( length(recorder.af.global[,1]) ) ) )

###--- Africa vs Western (all authors) ---###
for ( i in 1:len.csv.list ) {
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  len.area <- length( dat$area )
  
  for ( j in 1:len.area ) {
    if( dat$area[j] == "Africa" && dat$status[j] == "middle" ){
      for ( k in (j-1):1 ){
        if( dat$status[k] == "first" ){
          if( dat$area[k] == "Africa" ){ break }
          else if( dat$area[k] != "Africa" ){
            recorder.af.global.all <- rbind( recorder.af.global.all,
                                             c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[k], dat$area[j], dat$nation[k], dat$nation[j], dat$author[k], dat$author[j] ) 
                                            )
            break
          }
        }
      }
    }
  }
  
}
if( !is.null( recorder.af.global.all ) ) colnames( recorder.af.global.all ) <- c( "Volume", "Article", "Title", "First (Area)", "Middle (Area)", "First (Nation)", "Middle (Nation)", "First (Name)", "Middle (Name)" )
print( paste( "Africa vs Western (all authors):", as.character( length(recorder.af.global.all[,1]) ) ) )

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
        if( dat$status[k] == "first" ){
          if( dat$area[k] != "Africa" ){ break }
          else if( dat$area[k] == "Africa" ){
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
  
}
if( !is.null( recorder.af.local ) ) colnames( recorder.af.local ) <- c( "Volume", "Article", "Title", "First", "Middle" )
print( paste( "Africa, developing vs advanced:", as.character( length(recorder.af.local[,1]) ) ) )

###--- The number of first authors in South America ---###
count.first.sa <- 0
count.middle.sa <- 0

for ( i in 1:len.csv.list ) { #
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  prev.num.first <- -1
  prev.num.middle <- -1
  
  len.area <- length( dat$area )
  for ( j in 1:len.area ) {
    if( dat$area[j] == "South America" && dat$status[j] == "first" ){
      if( prev.num.first != dat[j,1] ){
        count.first.sa <- count.first.sa + 1
        prev.num.first <- dat[j,1]
      }
    }
  }
  
  for ( j in 1:len.area ) {
    if( dat$area[j] == "South America" && dat$status[j] == "middle" ){
      if( prev.num.middle != dat[j,1] ){
        count.middle.sa <- count.middle.sa + 1
        prev.num.middle <- dat[j,1]
      }
    }
  }
  
}
print( paste( "The number of papers including first authors in South America =", as.character(count.first.sa) ) )
print( paste( "The number of papers including middle authors in South America =", as.character(count.middle.sa) ) )

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
        if( dat$status[k] == "first" ){
          if( dat$area[k] == "South America" ){ break }
          else if( dat$area[k] != "South America" ){
            if( prev.num != dat[j,1] ){
              recorder.sa.global <- rbind( recorder.sa.global,
                                           c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[k], dat$area[j], dat$nation[k], dat$nation[j], dat$author[k], dat$author[j] ) 
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
if( !is.null( recorder.sa.global ) ) colnames( recorder.sa.global ) <- c( "Volume", "Article", "Title", "First (Area)", "Middle (Area)", "First (Nation)", "Middle (Nation)", "First (Name)", "Middle (Name)" )
print( paste( "South America vs Western:", as.character( length(recorder.sa.global[,1]) ) ) )

###--- South America vs Western (all authors) ---###
for ( i in 1:len.csv.list ) {
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  len.area <- length( dat$area )
  
  for ( j in 1:len.area ) {
    if( dat$area[j] == "South America" && dat$status[j] == "middle" ){
      for ( k in (j-1):1 ){
        if( dat$status[k] == "first" ){
          if( dat$area[k] == "South America" ){ break }
          else if( dat$area[k] != "South America" ){
            recorder.sa.global.all <- rbind( recorder.sa.global.all,
                                             c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[k], dat$area[j], dat$nation[k], dat$nation[j], dat$author[k], dat$author[j] ) 
            )
            break
          }
        }
      }
    }
  }
  
}
if( !is.null( recorder.sa.global.all ) ) colnames( recorder.sa.global.all ) <- c( "Volume", "Article", "Title", "First (Area)", "Middle (Area)", "First (Nation)", "Middle (Nation)", "First (Name)", "Middle (Name)" )
print( paste( "South America vs Western (all authors):", as.character( length(recorder.sa.global.all[,1]) ) ) )

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
        if( dat$status[k] == "first" ){
          if( dat$area[k] != "South America" ){ break }
          else if( dat$area[k] == "South America" ){
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
  
}
if( !is.null( recorder.sa.local ) ) colnames( recorder.sa.local ) <- c( "Volume", "Article", "Title", "First", "Middle" )
print( paste( "South America, developing vs advanced:", as.character( length(recorder.sa.local[,1]) ) ) )

###--- write csv ---###
#if( !is.null( recorder.ea.global ) ) write.csv( recorder.ea.global, file = "../first-middle/first-middle_ea_global.csv" )
#if( !is.null( recorder.ea.local ) ) write.csv( recorder.ea.local, file = "../first-middle/first-middle_ea_local.csv" )
#if( !is.null( recorder.af.global ) ) write.csv( recorder.af.global, file = "../first-middle/first-middle_af_global.csv" )
#if( !is.null( recorder.af.local ) ) write.csv( recorder.af.local, file = "../first-middle/first-middle_af_local.csv" )
#if( !is.null( recorder.sa.global ) ) write.csv( recorder.sa.global, file = "../first-middle/first-middle_sa_global.csv" )
#if( !is.null( recorder.sa.local ) ) write.csv( recorder.sa.local, file = "../first-middle/first-middle_sa_local.csv" )
if( !is.null( recorder.ea.global.all ) ) write.csv( recorder.ea.global.all, file = "../first-middle/first-middle_ea_global-all.csv" )
if( !is.null( recorder.af.global.all ) ) write.csv( recorder.af.global.all, file = "../first-middle/first-middle_af_global-all.csv" )
if( !is.null( recorder.sa.global.all ) ) write.csv( recorder.sa.global.all, file = "../first-middle/first-middle_sa_global-all.csv" )
#if( !is.null( recorder.ea.local.all ) ) write.csv( recorder.ea.local.all, file = "../first-middle/first-middle_ea_local-all.csv" )
#if( !is.null( recorder.af.local.all ) ) write.csv( recorder.af.local.all, file = "../first-middle/first-middle_af_local-all.csv" )
#if( !is.null( recorder.sa.local.all ) ) write.csv( recorder.sa.local.all, file = "../first-middle/first-middle_sa_local-all.csv" )
