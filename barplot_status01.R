###--- setting working directory ---###
journal.dir <- "conservation_letters"
wd.name <- paste( paste("~/web_scraping",journal.dir,sep="/"), "result_with_nation", sep="/" )
setwd( wd.name )

###--- csv list ---###
csv_list <- list.files( pattern = "*.csv" )
len.csv.list <- length( csv_list )
###--- file name & shaping into the same length ---###
filename <- c()
first.len.list <- c()
for ( i in 1:len.csv.list ) {
  # file name
  filename <- c( filename, csv_list[i])
  # length of data
  dat <- read.csv( csv_list[i] )
  first.len.list <- c( first.len.list, length( dat$status ) )
}
len.max <- max( first.len.list )

###--- 1st data ---###
dat <- read.csv( csv_list[1] )
first <- data.frame( c( dat$status, rep( NA, length=(len.max-length(dat$status)) ) )  )

###--- add to data frame ---###
for ( i in 2:len.csv.list ) {
  dat <- read.csv( csv_list[i] )
  next.status <- data.frame( c( dat$status, rep( NA, length=(len.max-length(dat$status)) ) )  )
  first <- cbind( first, next.status )
}

###--- rename column names ---###
library("stringr")
colnames( first ) <- str_sub( filename, end=-7 )
if( journal.dir == "conservation_letters" ){
  years <- as.numeric( str_sub( filename, start=8, end=9 ) ) + 2007
} else if( journal.dir == "evolution" ){
  years <- as.numeric( str_sub( filename, start=8, end=9 ) ) + 1946
} else if( journal.dir == "ecology" ){
  years <- as.numeric( str_sub( filename, start=8, end=9 ) ) + 1919
}


###--- proportion of Asia ---###
first.na <- c()
first.sa <- c()
first.eu <- c()
first.af <- c()
first.oc <- c()
first.mea <- c()
first.ea <- c()
first.ru <- c()
first.other <- c()

for ( j in 1:ncol( areas ) ) {
  for ( i in 1:nrow( areas ) ) {
    if( !is.na( areas[i,j] ) ){
      if( areas[i,j] == "North America" ){  first.na <- c( first.na, first[i,j] )
      } else if( areas[i,j] == "South America" ){  first.sa <- c( first.sa, first[i,j] )
      } else if( areas[i,j] == "Europe" ){  first.eu <- c( first.eu, first[i,j] )
      } else if( areas[i,j] == "Africa" ){  first.af <- c( first.af, first[i,j] )
      } else if( areas[i,j] == "Oceania" ){  first.oc <- c( first.oc, first[i,j] )
      } else if( areas[i,j] == "Middle East Asia" ){  first.mea <- c( first.mea, first[i,j] )
      } else if( areas[i,j] == "East Asia" ){  first.ea <- c( first.ea, first[i,j] )
      } else if( areas[i,j] == "Russia" ){  first.ru <- c( first.ru, first[i,j] )
      } else{  first.other <- c( first.other, first[i,j] )
        #print( paste( paste("j =",as.character(j)), paste("i =",as.character(i)) ) )
      }
    }
  }
}

###--- selecting first ---###
library(reshape2)
library("openxlsx")
# north america
prop.first.na <- c(
  length( first.na ),
  length( which( first.na=="first" ) )
)

# south america
prop.first.sa <- c(
  length( first.sa ),
  length( which( first.sa=="first" ) )
)

# europe
prop.first.eu <- c(
  length( first.eu ),
  length( which( first.eu=="first" ) )
)

# africa
prop.first.af <- c(
  length( first.af ),
  length( which( first.af=="first" ) )
)

# oceania
prop.first.oc <- c(
  length( first.oc ),
  length( which( first.oc=="first" ) )
)

# middle east asia
prop.first.mea <- c(
  length( first.mea ),
  length( which( first.mea=="first" ) )
)

# east asia
prop.first.ea <- c(
  length( first.ea ),
  length( which( first.ea=="first" ) )
)

# russia
prop.first.ru <- c(
  length( first.ru ),
  length( which( first.ru=="first" ) )
)

# other
prop.first.other <- c(
  length( first.other ),
  length( which( first.other=="first" ) )
)

count.first <- data.frame(
  cbind(
    t(t(
      c( "North America", "South America", "Europe", "Africa", "Oceania", 
         "Middle East Asia", "East Asia", "Russia", "Others" )
    )), 
    rbind(
      prop.first.na,
      prop.first.sa,
      prop.first.eu,
      prop.first.af,
      prop.first.oc,
      prop.first.mea,
      prop.first.ea,
      prop.first.ru,
      prop.first.other
    )
  )
)
colnames( count.first ) <- c( "Area", "total", "first" )

# write.xlsx( count.first, paste( "count.first.6year-", ".xlsx", sep=journal.dir ) )

###--- proportion of Asia ---###
first.na.nation <- c()
first.sa.nation <- c()
first.eu.nation <- c()
first.af.nation <- c()
first.oc.nation <- c()
first.mea.nation <- c()
first.ea.nation <- c()
first.ru.nation <- c()
first.other.nation <- c()

for ( j in 1:ncol( areas ) ) {
  for ( i in 1:nrow( areas ) ) {
    if( !is.na( areas[i,j] ) ){
      if( areas[i,j] == "North America" ){
        if( first[i,j] == "first" ){
          first.na.nation <- c( first.na.nation, nations[i,j] )
        }
      } else if( areas[i,j] == "South America" ){  
        if( first[i,j] == "first" ){
          first.sa.nation <- c( first.sa.nation, nations[i,j] )
        }
      } else if( areas[i,j] == "Europe" ){  
        if( first[i,j] == "first" ){
          first.eu.nation <- c( first.eu.nation, nations[i,j] )
        }
      } else if( areas[i,j] == "Africa" ){  
        if( first[i,j] == "first" ){
          first.af.nation <- c( first.af.nation, nations[i,j] )
        }
      } else if( areas[i,j] == "Oceania" ){  
        if( first[i,j] == "first" ){
          first.oc.nation <- c( first.oc.nation, nations[i,j] )
        }
      } else if( areas[i,j] == "Middle East Asia" ){  
        if( first[i,j] == "first" ){
          first.mea.nation <- c( first.mea.nation, nations[i,j] )
        }
      } else if( areas[i,j] == "East Asia" ){  
        if( first[i,j] == "first" ){
          first.ea.nation <- c( first.ea.nation, nations[i,j] )
        }
      } else if( areas[i,j] == "Russia" ){  
        if( first[i,j] == "first" ){
          first.ru.nation <- c( first.ru.nation, nations[i,j] )
        }
      } else{  
        if( first[i,j] == "first" ){
          first.other.nation <- c( first.other.nation, nations[i,j] )
        } #print( paste( paste("j =",as.character(j)), paste("i =",as.character(i)) ) )
      }
    }
  }
}

###--- selecting first ---###
library(reshape2)
library("openxlsx")
# north america
for ( i in 1:length(usa) ) first.na.nation[ which( first.na.nation==usa[i] ) ] = "USA"
prop.first.na <- cbind(
  t( t( unique(first.na.nation) ) ),
  matrix( sapply(unique(first.na.nation), function(x){sum(first.na.nation==x)}) )
)

# south america
for ( i in 1:length(brazil) ) first.sa.nation[ which( first.sa.nation==brazil[i] ) ] = "Brazil"
for ( i in 1:length(mexico) ) first.sa.nation[ which( first.sa.nation==mexico[i] ) ] = "Mexico"
for ( i in 1:length(panama) ) first.sa.nation[ which( first.sa.nation==panama[i] ) ] = "Panama"
for ( i in 1:length(peru) ) first.sa.nation[ which( first.sa.nation==peru[i] ) ] = "Peru"

prop.first.sa <- cbind(
  t( t( unique(first.sa.nation) ) ),
  matrix( sapply(unique(first.sa.nation), function(x){sum(first.sa.nation==x)}) )
)

# europe
for ( i in 1:length(uk) ) first.eu.nation[ which( first.eu.nation==uk[i] ) ] = "UK"
for ( i in 1:length(france) ) first.eu.nation[ which( first.eu.nation==france[i] ) ] = "France"
for ( i in 1:length(czech.republic) ) first.eu.nation[ which( first.eu.nation==czech.republic[i] ) ] = "Czech Republic"
for ( i in 1:length(netherlands) ) first.eu.nation[ which( first.eu.nation==netherlands[i] ) ] = "Netherlands"

prop.first.eu <- cbind(
  t( t( unique(first.eu.nation) ) ),
  matrix( sapply(unique(first.eu.nation), function(x){sum(first.eu.nation==x)}) )
)

# africa
first.af.nation[ which( first.af.nation=="Alexandria" ) ] = "Egypt"

prop.first.af <- cbind(
  t( t( unique(first.af.nation) ) ),
  matrix( sapply(unique(first.af.nation), function(x){sum(first.af.nation==x)}) )
)

# oceania
first.oc.nation[ which( first.oc.nation=="Queensland" ) ] = "Australia"
first.oc.nation[ which( first.oc.nation=="New South Wales" ) ] = "Australia"

prop.first.oc <- cbind(
  t( t( unique(first.oc.nation) ) ),
  matrix( sapply(unique(first.oc.nation), function(x){sum(first.oc.nation==x)}) )
)

# middle east asia
if( !is.null( first.mea.nation ) ){
  prop.first.mea <- cbind(
    t( t( unique(first.mea.nation) ) ),
    matrix( sapply(unique(first.mea.nation), function(x){sum(first.mea.nation==x)}) )
  )
}

# east asia
prop.first.ea <- cbind(
  t( t( unique(first.ea.nation) ) ),
  matrix( sapply(unique(first.ea.nation), function(x){sum(first.ea.nation==x)}) )
)

# russia
prop.first.ru <- cbind(
  t( t( unique(first.ru.nation) ) ),
  matrix( sapply(unique(first.ru.nation), function(x){sum(first.ru.nation==x)}) )
)

# other
if( !is.null( first.other.nation ) ){
  prop.first.other <- cbind(
    t( t( unique(first.other.nation) ) ),
    matrix( sapply(unique(first.other.nation), function(x){sum(first.other.nation==x)}) )
  )
}

# wtite ecxel sheets
sheetList<-list("north_america"=prop.first.na, 
                "south_america"=prop.first.sa, 
                "europe"=prop.first.eu, 
                "africa"=prop.first.af, 
                "oceania"=prop.first.oc, 
                "middle_east_asia"=prop.first.mea, 
                "east_asia"=prop.first.ea, 
                "russia"=prop.first.ru, 
                "other"=prop.first.other
)

# write.xlsx( sheetList, "prop.first.6year-evolution.xlsx" )
