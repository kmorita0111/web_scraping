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
recorder.ea.first <- c(); recorder.ea.middle <- c()
recorder.af.global <- c(); recorder.af.local <- c(); recorder.af.global.all <- c(); recorder.af.local.all <- c()
recorder.af.first <- c(); recorder.af.middle <- c()
recorder.sa.global <- c(); recorder.sa.local <- c(); recorder.sa.global.all <- c(); recorder.sa.local.all <- c()
recorder.sa.first <- c(); recorder.sa.middle <- c()

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

###--- The number of first authors in East Asia ---###
print( "======( East Asia )======" )
count.first.ea <- 0
count.middle.ea <- 0
filename <- c()

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
    if( dat$area[j] == "East Asia" && dat$status[j] == "first" ){
      recorder.ea.first <- rbind( recorder.ea.first,
                                   c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[j], dat$nation[j], dat$author[j] ) 
      )
    }
  }
  
  for ( j in 1:len.area ) {
    if( dat$area[j] == "East Asia" && (dat$status[j] == "middle" || dat$status[j] == "last") ){
      if( prev.num.middle != dat[j,1] ){
        recorder.ea.middle <- rbind( recorder.ea.middle,
                                    c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[j], dat$nation[j], dat$author[j] ) 
        )
        count.middle.ea <- count.middle.ea + 1
        prev.num.middle <- dat[j,1]
      }
    }
  }
  
}
print( paste( "The number of papers including first authors from East Asia =", as.character(count.first.ea) ) )
if( !is.null( recorder.ea.first ) ) colnames( recorder.ea.first ) <- c( "Volume", "Article", "Title", "First (Area)", "First (Nation)", "First (Name)" )
print( paste( "The number of papers including middle authors from East Asia =", as.character(count.middle.ea) ) )

###--- East Asia vs Western ---###
filename <- c()
for ( i in 1:len.csv.list ) {
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  len.area <- length( dat$area )
  prev.num <- -1
  
  ###--- the number of papers ---###
  for ( j in 1:len.area ) {
    if( dat$area[j] == "East Asia" && (dat$status[j] == "middle" || dat$status[j] == "last") ){
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

  ###--- all authors ---###
  for ( j in 1:len.area ) {
    if( dat$area[j] == "East Asia" && (dat$status[j] == "middle" || dat$status[j] == "last") ){
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
if( !is.null( recorder.ea.global ) ) colnames( recorder.ea.global ) <- c( "Volume", "Article", "Title", "First (Area)", "Middle (Area)", "First (Nation)", "Middle (Nation)", "First (Name)", "Middle (Name)" )
print( paste( "East Asia (middle) vs Western (first) (Paper):", as.character( length(recorder.ea.global[,1]) ) ) )
if( !is.null( recorder.ea.global.all ) ) colnames( recorder.ea.global.all ) <- c( "Volume", "Article", "Title", "First (Area)", "Middle (Area)", "First (Nation)", "Middle (Nation)", "First (Name)", "Middle (Name)" )
print( paste( "East Asia (middle) vs Western (first) (Author):", as.character( length(recorder.ea.global.all[,1]) ) ) )

###--- Asia is only first author ---###
recorder.ea.only.global <- c(); recorder.ea.only.global.all <- c()
filename <- c()
for ( i in 1:len.csv.list ) {
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  len.area <- length( dat$area )
  for ( j in 1:len.area ) {
    
    if( dat$area[j] == "East Asia" && dat$status[j] == "first" ){
      num.middle.ea <- 0
      for ( k in (j+1):len.area ){ 
        if( !is.na( dat$status[k]) && dat$status[k] == "first" ){ 
          #if( prev.num.first != dat[j,1] ){
          if( num.middle.ea == 0 ){
            recorder.ea.only.global <- rbind( recorder.ea.only.global,
                                              c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[j], dat$nation[j], dat$author[j] ) 
            )
            for ( l in (j+1):(k-1) ) {
              recorder.ea.only.global.all <- rbind( recorder.ea.only.global.all,
                                                c( csv_list[i], paste( "No.", as.character(dat[l,1]+1) ), dat$title[l], dat$area[l], dat$nation[l], dat$author[l] ) 
              )
            }
          }
          #prev.num.first <- dat[j,1]
          #}
          break
          
        } else if( k==(j+1) && is.na( dat$status[k] ) ){ 
          if( num.middle.ea == 0 ){
            recorder.ea.only.global <- rbind( recorder.ea.only.global,
                                              c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[j], dat$nation[j], dat$author[j] ) 
            )
          }
          break
          
        } else if( k==len.area ){ 
          if( num.middle.ea == 0 ){
            recorder.ea.only.global <- rbind( recorder.ea.only.global,
                                              c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[j], dat$nation[j], dat$author[j] ) 
            )
            for ( l in (j+1):k ) {
              recorder.ea.only.global.all <- rbind( recorder.ea.only.global.all,
                                                    c( csv_list[i], paste( "No.", as.character(dat[l,1]+1) ), dat$title[l], dat$area[l], dat$nation[l], dat$author[l] ) 
              )
            }
          }
          break
          
        } else if( dat$status[k] == "middle" || dat$status[k] == "last" ){
          if( dat$area[k] == "East Asia" ){ num.middle.ea <- num.middle.ea + 1 } 
        }
      }
    }
    
  }
  
}
if( !is.null( recorder.ea.only.global ) ) colnames( recorder.ea.only.global ) <- c( "Volume", "Article", "Title", "First (Area)", "First (Nation)", "First (Name)" )
print( paste( "East Asia (First) but the others are Western (Paper):", as.character( length(recorder.ea.only.global[,1]) ) ) )

###--- East Asia, developing vs advanced ---###
filename <- c()
for ( i in 1:len.csv.list ) {
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  len.area <- length( dat$area )
  prev.num <- -1
  
  ###--- the number of papers ---###
  for ( j in 1:len.area ) {
    if( dat$area[j] == "East Asia" && (dat$status[j] == "middle" || dat$status[j] == "last") ){
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
  
  ###--- all authors ---###
  for ( j in 1:len.area ) {
    if( dat$area[j] == "East Asia" && (dat$status[j] == "middle" || dat$status[j] == "last") ){
      for ( k in (j-1):1 ){
        if( dat$status[k] == "first" ){
          if( dat$area[k] != "East Asia" ){ break }
          else if( dat$area[k] == "East Asia" ){
            if( dat$nation[k] != dat$nation[j] ){
              recorder.ea.local.all <- rbind( recorder.ea.local.all,
                                              c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$nation[k], dat$nation[j] ) 
              )
              break
            }
          }
        }
      }
    }
  }
  #for ( j in 1:len.area ) {
  #  if( dat$area[j] == "East Asia" && dat$status[j] == "middle" ){
  #    for ( k in (j-1):1 ){
  #      if( dat$area[k] != "East Asia" && dat$status[k] == "first" ){ break } 
  #      else if( dat$area[k] == "East Asia" && dat$status[k] == "first" ){
  #        recorder.ea.local.all <- rbind( recorder.ea.local.all,
  #                                         c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$nation[k], dat$nation[j] ) 
  #        )
  #        break
  #      }
  #    }
  #  }
  #}
  
}
if( !is.null( recorder.ea.local ) ) colnames( recorder.ea.local ) <- c( "Volume", "Article", "Title", "First (Nation)", "Middle (Nation)" )
print( paste( "East Asia, developing (middle) vs advanced (first) (Paper):", as.character( length(recorder.ea.local[,1]) ) ) )
if( !is.null( recorder.ea.local.all ) ) colnames( recorder.ea.local.all ) <- c( "Volume", "Article", "Title", "First (Nation)", "Middle (Nation)" )
print( paste( "East Asia, developing (middle) vs advanced (first) (Author):", as.character( length(recorder.ea.local.all[,1]) ) ) )

#len.ea.global <- length(recorder.ea.global[,1])
#del.row <- c()
#for ( i in 1:len.ea.global ) {
#  j.vec <- which(recorder.ea.global[i,1] == recorder.ea.middle[,1])
#  for ( j in j.vec ) {
#    if(recorder.ea.global[i,2] == recorder.ea.middle[j,2]){
#      del.row <- c(del.row, j)
#    }
#  }
#}
#match.mid.fir.ea <- recorder.ea.middle[-del.row,]
#first.all.ea <- rbind( match.mid.fir.ea, recorder.ea.only.global )
#
#len.first.all.ea <- length(first.all.ea[,1])
#del.row <- c()
#for ( i in 1:len.first.all.ea ) {
#  j.vec <- which(first.all.ea[i,1] == recorder.ea.first[,1])
#  for ( j in j.vec ) {
#    if(first.all.ea[i,2] == recorder.ea.first[j,2]){
#      del.row <- c(del.row, j)
#    }
#  }
#}
#first.rest.ea <- recorder.ea.first[-del.row,]

###--- The number of first authors in Africa ---###
print( "======( Africa )======" )
count.first.af <- 0
count.middle.af <- 0
filename <- c()

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
    if( dat$area[j] == "Africa" && dat$status[j] == "first" ){
      recorder.af.first <- rbind( recorder.af.first,
                                  c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[j], dat$nation[j], dat$author[j] ) 
      )
    }
  }
  
  for ( j in 1:len.area ) {
    if( dat$area[j] == "Africa" && (dat$status[j] == "middle" || dat$status[j] == "last") ){
      if( prev.num.middle != dat[j,1] ){
        count.middle.af <- count.middle.af + 1
        prev.num.middle <- dat[j,1]
      }
    }
  }
  
}
print( paste( "The number of papers including first authors from Africa =", as.character(count.first.af) ) )
if( !is.null( recorder.af.first ) ) colnames( recorder.af.first ) <- c( "Volume", "Article", "Title", "First (Area)", "First (Nation)", "First (Name)" )
print( paste( "The number of papers including middle authors from Africa =", as.character(count.middle.af) ) )

###--- Africa vs Western ---###
filename <- c()
for ( i in 1:len.csv.list ) { #
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  len.area <- length( dat$area )
  prev.num <- -1
  
  ###--- the number of papers ---###
  for ( j in 1:len.area ) {
    if( dat$area[j] == "Africa" && (dat$status[j] == "middle" || dat$status[j] == "last") ){
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
  
  ###--- all authors ---###
  for ( j in 1:len.area ) {
    if( dat$area[j] == "Africa" && (dat$status[j] == "middle" || dat$status[j] == "last") ){
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
if( !is.null( recorder.af.global ) ) colnames( recorder.af.global ) <- c( "Volume", "Article", "Title", "First (Area)", "Middle (Area)", "First (Nation)", "Middle (Nation)", "First (Name)", "Middle (Name)" )
print( paste( "Africa (middle) vs Western (first) (Paper):", as.character( length(recorder.af.global[,1]) ) ) )
if( !is.null( recorder.af.global.all ) ) colnames( recorder.af.global.all ) <- c( "Volume", "Article", "Title", "First (Area)", "Middle (Area)", "First (Nation)", "Middle (Nation)", "First (Name)", "Middle (Name)" )
print( paste( "Africa (middle) vs Western (first) (Author):", as.character( length(recorder.af.global.all[,1]) ) ) )

recorder.af.only.global <- c(); recorder.af.only.global.all <- c()
filename <- c()
for ( i in 1:len.csv.list ) {
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  len.area <- length( dat$area )
  for ( j in 1:len.area ) {
    
    if( dat$area[j] == "Africa" && dat$status[j] == "first" ){
      num.middle.af <- 0
      for ( k in (j+1):len.area ){ 
        if( !is.na( dat$status[k]) && dat$status[k] == "first" ){ 
          #if( prev.num.first != dat[j,1] ){
          if( num.middle.af == 0 ){
            recorder.af.only.global <- rbind( recorder.af.only.global,
                                              c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[j], dat$nation[j], dat$author[j] ) 
            )
            for ( l in (j+1):(k-1) ) {
              recorder.af.only.global.all <- rbind( recorder.af.only.global.all,
                                                    c( csv_list[i], paste( "No.", as.character(dat[l,1]+1) ), dat$title[l], dat$area[l], dat$nation[l], dat$author[l] ) 
              )
            }
          }
          #prev.num.first <- dat[j,1]
          #}
          break
          
        } else if( k==(j+1) && is.na( dat$status[k] ) ){ 
          if( num.middle.af == 0 ){
            recorder.af.only.global <- rbind( recorder.af.only.global,
                                              c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[j], dat$nation[j], dat$author[j] ) 
            )
          }
          break
          
        } else if( k==len.area ){ 
          if( num.middle.af == 0 ){
            recorder.af.only.global <- rbind( recorder.af.only.global,
                                              c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[j], dat$nation[j], dat$author[j] ) 
            )
            for ( l in (j+1):k ) {
              recorder.af.only.global.all <- rbind( recorder.af.only.global.all,
                                                    c( csv_list[i], paste( "No.", as.character(dat[l,1]+1) ), dat$title[l], dat$area[l], dat$nation[l], dat$author[l] ) 
              )
            }
          }
          break
          
        } else if( dat$status[k] == "middle" || dat$status[k] == "last" ){
          if( dat$area[k] == "Africa" ){ num.middle.af <- num.middle.af + 1 } 
        }
      }
    }
    
  }
  
}
if( !is.null( recorder.af.only.global ) ) colnames( recorder.af.only.global ) <- c( "Volume", "Article", "Title", "First (Area)", "First (Nation)", "First (Name)" )
print( paste( "Africa (First) but the others are Western (Paper):", as.character( length(recorder.af.only.global[,1]) ) ) )

###--- Africa, developing vs advanced ---###
filename <- c()
for ( i in 1:len.csv.list ) { #
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  len.area <- length( dat$area )
  prev.num <- -1
  
  ###--- the number of papers ---###
  for ( j in 1:len.area ) {
    if( dat$area[j] == "Africa" && (dat$status[j] == "middle" || dat$status[j] == "last") ){
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
  
  ###--- all authors ---###
  for ( j in 1:len.area ) {
    if( dat$area[j] == "Africa" && (dat$status[j] == "middle" || dat$status[j] == "last") ){
      for ( k in (j-1):1 ){
        if( dat$status[k] == "first" ){
          if( dat$area[k] != "Africa" ){ break }
          else if( dat$area[k] == "Africa" ){
            recorder.af.local.all <- rbind( recorder.af.local.all,
                                            c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$nation[k], dat$nation[j] ) 
            )
            break
          }
        }
      }
    }
  }
  
}
if( !is.null( recorder.af.local ) ) colnames( recorder.af.local ) <- c( "Volume", "Article", "Title", "First", "Middle" )
print( paste( "Africa, developing (middle) vs advanced (first) (Paper):", as.character( length(recorder.af.local[,1]) ) ) )
if( !is.null( recorder.af.local.all ) ) colnames( recorder.af.local.all ) <- c( "Volume", "Article", "Title", "First", "Middle" )
print( paste( "Africa, developing (middle) vs advanced (first) (Author):", as.character( length(recorder.af.local.all[,1]) ) ) )

###--- The number of first authors in South America ---###
print( "======( South America )======" )
count.first.sa <- 0
count.middle.sa <- 0
filename <- c()

for ( i in 1:len.csv.list ) {
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
    if( dat$area[j] == "South America" && dat$status[j] == "first" ){
      recorder.sa.first <- rbind( recorder.sa.first,
                                  c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[j], dat$nation[j], dat$author[j] ) 
      )
    }
  }
  
  for ( j in 1:len.area ) {
    if( dat$area[j] == "South America" && (dat$status[j] == "middle" || dat$status[j] == "last") ){
      if( prev.num.middle != dat[j,1] ){
        count.middle.sa <- count.middle.sa + 1
        prev.num.middle <- dat[j,1]
      }
    }
  }
  
}
print( paste( "The number of papers including first authors from South America =", as.character(count.first.sa) ) )
if( !is.null( recorder.sa.first ) ) colnames( recorder.sa.first ) <- c( "Volume", "Article", "Title", "First (Area)", "First (Nation)", "First (Name)" )
print( paste( "The number of papers including middle authors from South America =", as.character(count.middle.sa) ) )

###--- South America vs Western ---###
filename <- c()
for ( i in 1:len.csv.list ) { #
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  len.area <- length( dat$area )
  prev.num <- -1
  
  ###--- the number of papers ---###
  for ( j in 1:len.area ) {
    if( dat$area[j] == "South America" && (dat$status[j] == "middle" || dat$status[j] == "last") ){
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
  
  ###--- all authors ---###
  for ( j in 1:len.area ) {
    if( dat$area[j] == "South America" && (dat$status[j] == "middle" || dat$status[j] == "last") ){
      for ( k in (j-1):1 ){
        if( dat$status[k] == "first" ){
          if( dat$area[k] != "South America" ){ break }
          else if( dat$area[k] == "South America" ){
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
if( !is.null( recorder.sa.global ) ) colnames( recorder.sa.global ) <- c( "Volume", "Article", "Title", "First (Area)", "Middle (Area)", "First (Nation)", "Middle (Nation)", "First (Name)", "Middle (Name)" )
print( paste( "South America (middle) vs Western (first) (Paper):", as.character( length(recorder.sa.global[,1]) ) ) )
if( !is.null( recorder.sa.global.all ) ) colnames( recorder.sa.global.all ) <- c( "Volume", "Article", "Title", "First (Area)", "Middle (Area)", "First (Nation)", "Middle (Nation)", "First (Name)", "Middle (Name)" )
print( paste( "South America (middle) vs Western (first) (Author):", as.character( length(recorder.sa.global.all[,1]) ) ) )

recorder.sa.only.global <- c(); recorder.sa.only.global.all <- c()
filename <- c()
for ( i in 1:len.csv.list ) {
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  len.area <- length( dat$area )
  for ( j in 1:len.area ) {
    
    if( dat$area[j] == "South America" && dat$status[j] == "first" ){
      num.middle.sa <- 0
      for ( k in (j+1):len.area ){ 
        if( !is.na( dat$status[k]) && dat$status[k] == "first" ){ 
          #if( prev.num.first != dat[j,1] ){
          if( num.middle.sa == 0 ){
            recorder.sa.only.global <- rbind( recorder.sa.only.global,
                                              c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[j], dat$nation[j], dat$author[j] ) 
            )
            for ( l in (j+1):(k-1) ) {
              recorder.sa.only.global.all <- rbind( recorder.sa.only.global.all,
                                                    c( csv_list[i], paste( "No.", as.character(dat[l,1]+1) ), dat$title[l], dat$area[l], dat$nation[l], dat$author[l] ) 
              )
            }
          }
          #prev.num.first <- dat[j,1]
          #}
          break
          
        } else if( k==(j+1) && is.na( dat$status[k] ) ){ 
          if( num.middle.sa == 0 ){
            recorder.sa.only.global <- rbind( recorder.sa.only.global,
                                              c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[j], dat$nation[j], dat$author[j] ) 
            )
          }
          break
          
        } else if( k==len.area ){ 
          if( num.middle.sa == 0 ){
            recorder.sa.only.global <- rbind( recorder.sa.only.global,
                                              c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$area[j], dat$nation[j], dat$author[j] ) 
            )
            for ( l in (j+1):k ) {
              recorder.sa.only.global.all <- rbind( recorder.sa.only.global.all,
                                                    c( csv_list[i], paste( "No.", as.character(dat[l,1]+1) ), dat$title[l], dat$area[l], dat$nation[l], dat$author[l] ) 
              )
            }
          }
          break
          
        } else if( dat$status[k] == "middle" || dat$status[k] == "last" ){
          if( dat$area[k] == "South America" ){ num.middle.sa <- num.middle.sa + 1 } 
        }
      }
    }
    
  }
  
}
if( !is.null( recorder.sa.only.global ) ) colnames( recorder.sa.only.global ) <- c( "Volume", "Article", "Title", "First (Area)", "First (Nation)", "First (Name)" )
print( paste( "South America (First) but the others are Western (Paper):", as.character( length(recorder.sa.only.global[,1]) ) ) )

###--- South America, developing vs advanced ---###
filename <- c()
for ( i in 1:len.csv.list ) { #
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  
  len.area <- length( dat$area )
  prev.num <- -1
  
  ###--- the number of papers ---###
  for ( j in 1:len.area ) {
    if( dat$area[j] == "South America" && (dat$status[j] == "middle" || dat$status[j] == "last") ){
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
  
  ###--- all authors ---###
  for ( j in 1:len.area ) {
    if( dat$area[j] == "South America" && dat$status[j] == "middle" ){
      for ( k in (j-1):1 ){
        if( dat$status[k] == "first" ){
          if( dat$area[k] != "South America" ){ break }
          else if( dat$area[k] == "South America" ){
            recorder.sa.local.all <- rbind( recorder.sa.local.all,
                                            c( csv_list[i], paste( "No.", as.character(dat[j,1]+1) ), dat$title[j], dat$nation[k], dat$nation[j] ) 
            )
            break
          }
        }
      }
    }
  }
  
}
if( !is.null( recorder.sa.local ) ) colnames( recorder.sa.local ) <- c( "Volume", "Article", "Title", "First", "Middle" )
print( paste( "South America, developing (middle) vs advanced (first) (Paper):", as.character( length(recorder.sa.local[,1]) ) ) )
if( !is.null( recorder.sa.local.all ) ) colnames( recorder.sa.local.all ) <- c( "Volume", "Article", "Title", "First", "Middle" )
print( paste( "South America, developing (middle) vs advanced (first) (Author):", as.character( length(recorder.sa.local.all[,1]) ) ) )

###--- write csv ---###
##-- Global South (middle) vs Western (first) (Paper) --##
#if( !is.null( recorder.ea.global ) ) write.csv( recorder.ea.global, file = "../first-middle/first-middle_ea_global.csv" )
#if( !is.null( recorder.af.global ) ) write.csv( recorder.af.global, file = "../first-middle/first-middle_af_global.csv" )
#if( !is.null( recorder.sa.global ) ) write.csv( recorder.sa.global, file = "../first-middle/first-middle_sa_global.csv" )
##-- Global South, developing (middle) vs advanced (first) (Paper) --##
#if( !is.null( recorder.ea.local ) ) write.csv( recorder.ea.local, file = "../first-middle/first-middle_ea_local.csv" )
#if( !is.null( recorder.af.local ) ) write.csv( recorder.af.local, file = "../first-middle/first-middle_af_local.csv" )
#if( !is.null( recorder.sa.local ) ) write.csv( recorder.sa.local, file = "../first-middle/first-middle_sa_local.csv" )
##-- Global South (middle) vs Western (first) (authors) --##
#if( !is.null( recorder.ea.global.all ) ) write.csv( recorder.ea.global.all, file = "../first-middle/first-middle_ea_global-all.csv" )
#if( !is.null( recorder.af.global.all ) ) write.csv( recorder.af.global.all, file = "../first-middle/first-middle_af_global-all.csv" )
#if( !is.null( recorder.sa.global.all ) ) write.csv( recorder.sa.global.all, file = "../first-middle/first-middle_sa_global-all.csv" )
##-- Global South, developing (middle) vs advanced (first) (authros) --##
#if( !is.null( recorder.ea.local.all ) ) write.csv( recorder.ea.local.all, file = "../first-middle/first-middle_ea_local-all.csv" )
#if( !is.null( recorder.af.local.all ) ) write.csv( recorder.af.local.all, file = "../first-middle/first-middle_af_local-all.csv" )
#if( !is.null( recorder.sa.local.all ) ) write.csv( recorder.sa.local.all, file = "../first-middle/first-middle_sa_local-all.csv" )
##-- The number of papers including first authors from Global South --##
#if( !is.null( recorder.ea.first ) ) write.csv( recorder.ea.first, file = "../first-middle/first-middle_ea_first.csv" )
#if( !is.null( recorder.af.first ) ) write.csv( recorder.af.first, file = "../first-middle/first-middle_af_first.csv" )
#if( !is.null( recorder.sa.first ) ) write.csv( recorder.sa.first, file = "../first-middle/first-middle_sa_first.csv" )
