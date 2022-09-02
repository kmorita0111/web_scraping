###--- setting working directory ---###
journal.dir <- "evolution"
wd.name <- paste( paste("~/web_scraping",journal.dir,sep="/"), "result_with_nation", sep="/" )
setwd( wd.name )

###--- csv list ---###
csv_list <- list.files( pattern = "*.csv" )
len.csv.list <- length( csv_list )
###--- file name & shaping into the same length ---###
filename <- c()
areas.len.list <- c()
for ( i in 1:len.csv.list ) {
  # file name
  filename <- c( filename, csv_list[i])
  # length of data
  dat <- read.csv( csv_list[i] )
  areas.len.list <- c( areas.len.list, length( dat$area ) )
}
len.max <- max( areas.len.list )

###--- 1st data ---###
dat <- read.csv( csv_list[1] )
areas <- data.frame( c( dat$area, rep( NA, length=(len.max-length(dat$area)) ) )  )

###--- add to data frame ---###
for ( i in 2:len.csv.list ) {
  dat <- read.csv( csv_list[i] )
  next.area <- data.frame( c( dat$area, rep( NA, length=(len.max-length(dat$area)) ) )  )
  areas <- cbind( areas, next.area )
}

###--- rename column names ---###
library("stringr")
colnames( areas ) <- str_sub( filename, end=-7 )
years <- as.numeric( str_sub( filename, start=8, end=9 ) ) + 1946

###--- couting areas ---###
num.North.America<-0; num.South.America<-0; num.Europe<-0; num.Africa<-0
num.Oceania <-0; num.Middle.East.Asia<-0; num.East.Asia<-0; num.Russia<-0
num.Others<- 0

for ( i in 1:nrow( areas ) ) {
  for ( j in 1:ncol( areas ) ) {
    if( !is.na( areas[i,j] ) ){
      if( areas[i,j] == "North America" ){
        num.North.America <- num.North.America + 1
      } else if( areas[i,j] == "South America" ){
        num.South.America <- num.South.America + 1
      } else if( areas[i,j] == "Europe" ){
        num.Europe <- num.Europe + 1
      } else if( areas[i,j] == "Africa" ){
        num.Africa <- num.Africa + 1
      } else if( areas[i,j] == "Oceania" ){
        num.Oceania <- num.Oceania + 1
      } else if( areas[i,j] == "Middle East Asia" ){
        num.Middle.East.Asia <- num.Middle.East.Asia + 1
      } else if( areas[i,j] == "East Asia" ){
        num.East.Asia <- num.East.Asia + 1
      } else if( areas[i,j] == "Russia" ){
        num.Russia <- num.Russia + 1
      } else{
        #print( paste( paste("j =",as.character(j)), paste("i =",as.character(i)) ) )
        num.Others <- num.Others + 1
      }
    }
  }
}

# 6年間のデータ　まとめ
areas.duration <- c( "2017 ~ 2022", "2017 ~ 2022", "2017 ~ 2022", "2017 ~ 2022", "2017 ~ 2022", "2017 ~ 2022", "2017 ~ 2022", "2017 ~ 2022", "2017 ~ 2022" )
areas.name <- c( "North America", "South America", "Europe", "Africa", "Oceania", "Middle East Asia", "East Asia", "Russia", "Others" )
areas.count <- c( num.North.America, num.South.America, num.Europe, num.Africa, num.Oceania, num.Middle.East.Asia, num.East.Asia, num.Russia, num.Others )
areas.5year <- data.frame( areas.duration, areas.name, areas.count )

# 棒グラフ
#install.packages("ggplot2", dependencies=TRUE)
library(ggplot2)

g.bar <- ggplot(areas.5year, aes(x = areas.duration, y = areas.count, fill = areas.name)) + geom_bar(stat = "identity") #+ scale_fill_brewer(palette='Set1')
print( g.bar )
g.cir <- g.bar + coord_polar(theta = "y")
print( g.cir )
#ggsave( "evolution-6years.png" )
