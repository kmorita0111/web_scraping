###--- setting working directory ---###
journal.dir <- "conservation_letters"
wd.name <- paste( paste("~/web_scraping",journal.dir,sep="/"), "result_with_nation", sep="/" )
setwd( wd.name )

###--- csv list ---###
csv_list <- list.files( pattern = "*.csv" )
len.csv.list <- length( csv_list )
###--- file name & shaping into the same length ---###
filename <- c()
nations.len.list <- c()
for ( i in 1:len.csv.list ) {
  # file name
  filename <- c( filename, csv_list[i])
  # length of data
  dat <- read.csv( csv_list[i] )
  nations.len.list <- c( nations.len.list, length( dat$nation ) )
}
len.max <- max( nations.len.list )

###--- 1st data ---###
dat <- read.csv( csv_list[1] )
nations <- data.frame( c( dat$nation, rep( NA, length=(len.max-length(dat$nation)) ) )  )

###--- add to data frame ---###
for ( i in 2:len.csv.list ) {
  dat <- read.csv( csv_list[i] )
  next.nation <- data.frame( c( dat$nation, rep( NA, length=(len.max-length(dat$nation)) ) )  )
  nations <- cbind( nations, next.nation )
}

###--- rename column names ---###
library("stringr")
colnames( nations ) <- str_sub( filename, end=-7 )
if( journal.dir == "conservation_letters" ){
  years <- as.numeric( str_sub( filename, start=8, end=9 ) ) + 2007
} else if( journal.dir == "evolution" ){
  years <- as.numeric( str_sub( filename, start=8, end=9 ) ) + 1946
} else if( journal.dir == "ecology" ){
  years <- as.numeric( str_sub( filename, start=8, end=9 ) ) + 1919
}

###--- searching Asia ---###
row.North.America <- c(); col.North.America <- c()
row.South.America <- c(); col.South.America <- c()
row.Europe <- c(); col.Europe <- c()
row.Africa <- c(); col.Africa <- c()
row.Oceania <- c(); col.Oceania <- c()
row.Middle.East.Asia <- c(); col.Middle.East.Asia <- c()
row.East.Asia <- c(); col.East.Asia <- c()
row.Russia <- c(); col.Russia <- c()
row.Others <- c(); col.Others <- c()

nations.na <- c()
nations.sa <- c()
nations.eu <- c()
nations.af <- c()
nations.oc <- c()
nations.mea <- c()
nations.ea <- c()
nations.ru <- c()
nations.other <- c()


for ( j in 1:ncol( areas ) ) {
  for ( i in 1:nrow( areas ) ) {
    if( !is.na( areas[i,j] ) ){
      if( areas[i,j] == "North America" ){
        
        nations.na <- c( nations.na, nations[i,j] )
        
      } else if( areas[i,j] == "South America" ){
        
        nations.sa <- c( nations.sa, nations[i,j] )
        
      } else if( areas[i,j] == "Europe" ){

        nations.eu <- c( nations.eu, nations[i,j] )
        
      } else if( areas[i,j] == "Africa" ){
        
        nations.af <- c( nations.af, nations[i,j] )
        
      } else if( areas[i,j] == "Oceania" ){
        
        nations.oc <- c( nations.oc, nations[i,j] )
        
      } else if( areas[i,j] == "Middle East Asia" ){
        
        nations.mea <- c( nations.mea, nations[i,j] )
        
      } else if( areas[i,j] == "East Asia" ){
        
        nations.ea <- c( nations.ea, nations[i,j] )
        
      } else if( areas[i,j] == "Russia" ){
        
        nations.ru <- c( nations.ru, nations[i,j] )
        
      } else{
        #print( paste( paste("j =",as.character(j)), paste("i =",as.character(i)) ) )
        nations.other <- c( nations.other, nations[i,j] )
      }
    }
  }
}

###--- selecting nations ---###
library(reshape2)
library("openxlsx")
# north america
usa <- c("America","United States","Michigan","Hawaii","Wisconsin","Washington",
         "Maryland","Tennessee","Massachusetts","Connecticut","North Carolina","California",
         "Colorado","Idaho","Wyoming","New Jersey","Oregon","Alaska","New York","Florida",
         "Virginia","Texas","Alabama","Georgia","Utah","Maine","Illinois","Pennsylvania",
         "San Francisco","Arizona","Montana","Louisiana","Minnesota","Arkansas","Missouri",
         "Kentucky","Oklahoma","Ohio","Nevada","Kansas","Iowa","Nebraska","Harvard","Delaware",
         "Mississippi","San Diego","Houston","Austin","Chicago","Princeton","New Orleans",
         "South Dakota","North Dakota","Washington","Vermont","South Carolina","Syracuse",
         "Cottonwood St. Woodland","Middlebury","Hawai'i","Stanford"
        )
for ( i in 1:length(usa) ) {
  nations.na[ which( nations.na==usa[i] ) ] = "USA"
}

count.nations.na <- data.frame( 
  cbind( 
    rep( "2017 ~ 2022", length=length(unique(nations.na)) ), 
    unique(nations.na), 
    matrix( sapply(unique(nations.na), function(x){sum(nations.na==x)}) ) 
      ) 
  )
colnames( count.nations.na ) <- c("duration","Nation","count")

#print(
#  ggplot(count.nations.na, aes(x=duration, y=count, fill=Nation)) + 
#    geom_bar(stat = "identity", col="black") + 
#   guides(color = guide_legend(reverse = TRUE))
#)


# south america
brazil<-c("Brazil","Brasil"); mexico<-c("Mexico", "México"); panama<-c("Panama","Panamá"); peru<-c("Peru","Perú")
for ( i in 1:length(brazil) ) nations.sa[ which( nations.sa==brazil[i] ) ] = "Brazil"
for ( i in 1:length(mexico) ) nations.sa[ which( nations.sa==mexico[i] ) ] = "Mexico"
for ( i in 1:length(panama) ) nations.sa[ which( nations.sa==panama[i] ) ] = "Panama"
for ( i in 1:length(peru) ) nations.sa[ which( nations.sa==peru[i] ) ] = "Peru"

count.nations.sa <- data.frame( 
  cbind( 
    rep( "2017 ~ 2022", length=length(unique(nations.sa)) ), 
    unique(nations.sa), 
    matrix( sapply(unique(nations.sa), function(x){sum(nations.sa==x)}) ) 
  ) 
)
colnames( count.nations.sa ) <- c("duration","Nation","count")

# europe
uk<-c("United Kingdom","U.K.","Cambridge","England","Edinburgh","Hampshire","Ireland","Scotland")
france <- c("Montpellier")
czech.republic <- c("Czechia")
netherlands <- c("Curaçao")
for ( i in 1:length(uk) ) nations.eu[ which( nations.eu==uk[i] ) ] = "UK"
for ( i in 1:length(france) ) nations.eu[ which( nations.eu==france[i] ) ] = "France"
for ( i in 1:length(czech.republic) ) nations.eu[ which( nations.eu==czech.republic[i] ) ] = "Czech Republic"
for ( i in 1:length(netherlands) ) nations.eu[ which( nations.eu==netherlands[i] ) ] = "Netherlands"

count.nations.eu <- data.frame( 
  cbind( 
    rep( "2017 ~ 2022", length=length(unique(nations.eu)) ), 
    unique(nations.eu), 
    matrix( sapply(unique(nations.eu), function(x){sum(nations.eu==x)}) ) 
  ) 
)
colnames( count.nations.eu ) <- c("duration","Nation","count")

# africa
nations.af[ which( nations.af=="Alexandria" ) ] = "Egypt"

count.nations.af <- data.frame( 
  cbind( 
    rep( "2017 ~ 2022", length=length(unique(nations.af)) ), 
    unique(nations.af), 
    matrix( sapply(unique(nations.af), function(x){sum(nations.af==x)}) ) 
  ) 
)
colnames( count.nations.af ) <- c("duration","Nation","count")

# oceania
nations.oc[ which( nations.oc=="Queensland" ) ] = "Australia"
nations.oc[ which( nations.oc=="New South Wales" ) ] = "Australia"

count.nations.oc <- data.frame( 
  cbind( 
    rep( "2017 ~ 2022", length=length(unique(nations.oc)) ), 
    unique(nations.oc), 
    matrix( sapply(unique(nations.oc), function(x){sum(nations.oc==x)}) ) 
  ) 
)
colnames( count.nations.oc ) <- c("duration","Nation","count")

# middle east asia
count.nations.mea <- data.frame( 
  cbind( 
    rep( "2017 ~ 2022", length=length(unique(nations.mea)) ), 
    unique(nations.mea), 
    matrix( sapply(unique(nations.mea), function(x){sum(nations.mea==x)}) ) 
  ) 
)
colnames( count.nations.mea ) <- c("duration","Nation","count")

# east asia
count.nations.ea <- data.frame( 
  cbind( 
    rep( "2017 ~ 2022", length=length(unique(nations.ea)) ), 
    unique(nations.ea), 
    matrix( sapply(unique(nations.ea), function(x){sum(nations.ea==x)}) ) 
  ) 
)
colnames( count.nations.ea ) <- c("duration","Nation","count")

# russia
count.nations.ru <- data.frame( 
  cbind( 
    rep( "2017 ~ 2022", length=length(unique(nations.ru)) ), 
    unique(nations.ru), 
    matrix( sapply(unique(nations.ru), function(x){sum(nations.ru==x)}) ) 
  ) 
)
colnames( count.nations.ru ) <- c("duration","Nation","count")

# other
count.nations.other <- data.frame( 
  cbind( 
    rep( "2017 ~ 2022", length=length(unique(nations.other)) ), 
    unique(nations.other), 
    matrix( sapply(unique(nations.other), function(x){sum(nations.other==x)}) ) 
  ) 
)
colnames( count.nations.other ) <- c("duration","Nation","count")

sheetList<-list("north_america"=count.nations.na, 
                "south_america"=count.nations.sa, 
                "europe"=count.nations.eu, 
                "africa"=count.nations.af, 
                "oceania"=count.nations.oc, 
                "middle_east_asia"=count.nations.mea, 
                "east_asia"=count.nations.ea, 
                "russia"=count.nations.ru, 
                "other"=count.nations.other
                )
#write.xlsx( sheetList, paste("count.nations.na.6year-.xlsx", ".xlsx", sep=journal.dir) )
