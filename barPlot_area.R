###--- setting working directory ---###
journal.dir <- "conservation_letters"
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
if( journal.dir == "conservation_letters" ){
  years <- as.numeric( str_sub( filename, start=8, end=9 ) ) + 2007
} else if( journal.dir == "evolution" ){
  years <- as.numeric( str_sub( filename, start=8, end=9 ) ) + 1946
} else if( journal.dir == "ecology" ){
  years <- as.numeric( str_sub( filename, start=8, end=9 ) ) + 1919
}

########################################
###=== counting areas for 6 years ===###
########################################
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
library(plyr)
library(scales)

#g.bar <- ggplot(areas.5year, aes(x = areas.duration, y = areas.count, fill = areas.name)) + geom_bar(stat = "identity", col="black") #+ scale_fill_brewer(palette='Set1')
#print( g.bar )
#g.cir <- g.bar + coord_polar(theta = "y")
#print( g.cir )
#ggsave( "evolution-6years.png" )

# write excel
library("openxlsx")
#write.xlsx( areas.5year, paste("area_6year-",".xlsx",sep=journal.dir) )

###################################
###=== counting areas a year ===###
###################################
num.North.America<-0; num.South.America<-0; num.Europe<-0; num.Africa<-0
num.Oceania <-0; num.Middle.East.Asia<-0; num.East.Asia<-0; num.Russia<-0
num.Others<- 0

areas.count.2017 <- c( num.North.America, num.South.America, num.Europe, num.Africa, num.Oceania, num.Middle.East.Asia, num.East.Asia, num.Russia, num.Others )
areas.count.2018 <- c( num.North.America, num.South.America, num.Europe, num.Africa, num.Oceania, num.Middle.East.Asia, num.East.Asia, num.Russia, num.Others )
areas.count.2019 <- c( num.North.America, num.South.America, num.Europe, num.Africa, num.Oceania, num.Middle.East.Asia, num.East.Asia, num.Russia, num.Others )
areas.count.2020 <- c( num.North.America, num.South.America, num.Europe, num.Africa, num.Oceania, num.Middle.East.Asia, num.East.Asia, num.Russia, num.Others )
areas.count.2021 <- c( num.North.America, num.South.America, num.Europe, num.Africa, num.Oceania, num.Middle.East.Asia, num.East.Asia, num.Russia, num.Others )
areas.count.2022 <- c( num.North.America, num.South.America, num.Europe, num.Africa, num.Oceania, num.Middle.East.Asia, num.East.Asia, num.Russia, num.Others )

for ( j in 1:ncol( areas ) ) {
  
  num.North.America<-0; num.South.America<-0; num.Europe<-0; num.Africa<-0
  num.Oceania <-0; num.Middle.East.Asia<-0; num.East.Asia<-0; num.Russia<-0
  num.Others<- 0
  
  for ( i in 1:nrow( areas ) ) {
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
  
  if( years[j] == 2017 ){
    areas.count.2017 <- areas.count.2017 + c( num.North.America, num.South.America, num.Europe, num.Africa, num.Oceania, num.Middle.East.Asia, num.East.Asia, num.Russia, num.Others )
  } else if( years[j] == 2018 ){
    areas.count.2018 <- areas.count.2018 + c( num.North.America, num.South.America, num.Europe, num.Africa, num.Oceania, num.Middle.East.Asia, num.East.Asia, num.Russia, num.Others )
  } else if( years[j] == 2019 ){
    areas.count.2019 <- areas.count.2019 + c( num.North.America, num.South.America, num.Europe, num.Africa, num.Oceania, num.Middle.East.Asia, num.East.Asia, num.Russia, num.Others )
  } else if( years[j] == 2020 ){
    areas.count.2020 <- areas.count.2020 + c( num.North.America, num.South.America, num.Europe, num.Africa, num.Oceania, num.Middle.East.Asia, num.East.Asia, num.Russia, num.Others )
  } else if( years[j] == 2021 ){
    areas.count.2021 <- areas.count.2021 + c( num.North.America, num.South.America, num.Europe, num.Africa, num.Oceania, num.Middle.East.Asia, num.East.Asia, num.Russia, num.Others )
  } else if( years[j] == 2022 ){
    areas.count.2022 <- areas.count.2022 + c( num.North.America, num.South.America, num.Europe, num.Africa, num.Oceania, num.Middle.East.Asia, num.East.Asia, num.Russia, num.Others )
  }
  
}

###--- 各年のデータ　まとめ（絶対値）---###
areas.count.2017 <- c( 2017, areas.count.2017 )
areas.count.2018 <- c( 2018, areas.count.2018 )
areas.count.2019 <- c( 2019, areas.count.2019 )
areas.count.2020 <- c( 2020, areas.count.2020 )
areas.count.2021 <- c( 2021, areas.count.2021 )
areas.count.2022 <- c( 2022, areas.count.2022 )
areas.year <- rbind( areas.count.2017, areas.count.2018, areas.count.2019, 
                     areas.count.2020, areas.count.2021, areas.count.2022 )
areas.year <- data.frame( areas.year )
colnames( areas.year ) <- areas.name <- c( "", "North America", "South America", "Europe", "Africa", "Oceania", "Middle East Asia", "East Asia", "Russia", "Others" )

# write excel
#write.xlsx( areas.year, paste("area_year-",".xlsx",sep=journal.dir) )

print( hogehoge )

areas.duration <- rep( "2017", length=9 )
areas.name <- c( "North America", "South America", "Europe", "Africa", "Oceania", "Middle East Asia", "East Asia", "Russia", "Others" )
areas2017 <- cbind( areas.duration, areas.name, areas.count.2017 )

areas.duration <- rep( "2018", length=9 )
areas2018 <- cbind( areas.duration, areas.name, areas.count.2018 )

areas.duration <- rep( "2019", length=9 )
areas2019 <- cbind( areas.duration, areas.name, areas.count.2019 )

areas.duration <- rep( "2020", length=9 )
areas2020 <- cbind( areas.duration, areas.name, areas.count.2020 )

areas.duration <- rep( "2021", length=9 )
areas2021 <- cbind( areas.duration, areas.name, areas.count.2021 )

areas.duration <- rep( "2022", length=9 )
areas2022 <- cbind( areas.duration, areas.name, areas.count.2022 )

areas.year <- data.frame( rbind( areas2017, areas2018, areas2019, areas2020, areas2021, areas2022 ) )
colnames( areas.year ) <- c( "duration", "Area", "count" )

# write excel
# write.xlsx( areas.year, paste("area_year-",".xlsx",sep=journal.dir) )

# 棒グラフ
g.bar <- ggplot(areas.year, aes(x=duration, y=count, fill=Area)) + 
  geom_bar(stat = "identity", col="black") #+ scale_fill_brewer(palette='Set1')
print( g.bar )

#library(gridExtra)
#library(scales)
#g.bar <- ggplot(areas.year, aes(x=areas.duration, y=areas.count, fill=areas.name)) + 
  #geom_bar(position = "fill") 
  #geom_col(position = "fill") 

#print( ggplot(data = diamonds) + 
#         geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")
#      )

#g.plot2 <- ggplot(areas.year, aes(x=duration, y=count, fill=Area)) + 
#  geom_area(stat = "identity", position = "fill")
#print( g.plot2 )
#ggsave("evolution-year.png")


###--- 各年のデータ　まとめ（Ratio）---###
areas.duration <- rep( "2017", length=9 )
areas.name <- c( "North America", "South America", "Europe", "Africa", "Oceania", "Middle East Asia", "East Asia", "Russia", "Others" )
areas.count.2017 <- areas.count.2017/sum(areas.count.2017)*100
areas2017 <- cbind( areas.duration, areas.name, areas.count.2017 )

areas.duration <- rep( "2018", length=9 )
areas.count.2018 <- areas.count.2018/sum(areas.count.2018)*100
areas2018 <- cbind( areas.duration, areas.name, areas.count.2018 )

areas.duration <- rep( "2019", length=9 )
areas.count.2019 <- areas.count.2019/sum(areas.count.2019)*100
areas2019 <- cbind( areas.duration, areas.name, areas.count.2019 )

areas.duration <- rep( "2020", length=9 )
areas.count.2020 <- areas.count.2020/sum(areas.count.2020)*100
areas2020 <- cbind( areas.duration, areas.name, areas.count.2020 )

areas.duration <- rep( "2021", length=9 )
areas.count.2021 <- areas.count.2021/sum(areas.count.2021)*100
areas2021 <- cbind( areas.duration, areas.name, areas.count.2021 )

areas.duration <- rep( "2022", length=9 )
areas.count.2022 <- areas.count.2022/sum(areas.count.2022)*100
areas2022 <- cbind( areas.duration, areas.name, areas.count.2022 )

areas.year <- data.frame( rbind( areas2017, areas2018, areas2019, areas2020, areas2021, areas2022 ) )
colnames( areas.year ) <- c( "areas.duration", "areas.name", "areas.count" )

areas.year01 <- data.frame( rbind( areas.count.2017, areas.count.2018, areas.count.2019, areas.count.2020, areas.count.2021, areas.count.2022 ) )
colnames( areas.year01 ) <- areas.name
rownames( areas.year01 ) <- c( "2017", "2018", "2019", "2020", "2021", "2022"  )
