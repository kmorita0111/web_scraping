###=== nations a year ===###
first.na.2017 <- c(); first.na.2018 <- c(); first.na.2019 <- c(); first.na.2020 <- c(); first.na.2021 <- c(); first.na.2022 <- c()
first.sa.2017 <- c(); first.sa.2018 <- c(); first.sa.2019 <- c(); first.sa.2020 <- c(); first.sa.2021 <- c(); first.sa.2022 <- c()
first.eu.2017 <- c(); first.eu.2018 <- c(); first.eu.2019 <- c(); first.eu.2020 <- c(); first.eu.2021 <- c(); first.eu.2022 <- c()
first.af.2017 <- c(); first.af.2018 <- c(); first.af.2019 <- c(); first.af.2020 <- c(); first.af.2021 <- c(); first.af.2022 <- c()
first.oc.2017 <- c(); first.oc.2018 <- c(); first.oc.2019 <- c(); first.oc.2020 <- c(); first.oc.2021 <- c(); first.oc.2022 <- c()
first.mea.2017 <- c(); first.mea.2018 <- c(); first.mea.2019 <- c(); first.mea.2020 <- c(); first.mea.2021 <- c(); first.mea.2022 <- c()
first.ea.2017 <- c(); first.ea.2018 <- c(); first.ea.2019 <- c(); first.ea.2020 <- c(); first.ea.2021 <- c(); first.ea.2022 <- c()
first.ru.2017 <- c(); first.ru.2018 <- c(); first.ru.2019 <- c(); first.ru.2020 <- c(); first.ru.2021 <- c(); first.ru.2022 <- c()
first.other.2017 <- c(); first.other.2018 <- c(); first.other.2019 <- c(); first.other.2020 <- c(); first.other.2021 <- c(); first.other.2022 <- c()

for ( j in 1:ncol( areas ) ) {
  for ( i in 1:nrow( areas ) ) {
    if( !is.na( areas[i,j] ) ){
      if( areas[i,j] == "North America" ){
        
        if( years[j] == 2017 ){
          if( first[i,j] == "first" ) first.na.2017 <- c( first.na.2017, nations[i,j] )
        } else if( years[j] == 2018 ){
          if( first[i,j] == "first" ) first.na.2018 <- c( first.na.2018, nations[i,j] )
        } else if( years[j] == 2019 ){
          if( first[i,j] == "first" ) first.na.2019 <- c( first.na.2019, nations[i,j] )
        } else if( years[j] == 2020 ){
          if( first[i,j] == "first" ) first.na.2020 <- c( first.na.2020, nations[i,j] )
        } else if( years[j] == 2021 ){
          if( first[i,j] == "first" ) first.na.2021 <- c( first.na.2021, nations[i,j] )
        } else if( years[j] == 2022 ){
          if( first[i,j] == "first" ) first.na.2022 <- c( first.na.2022, nations[i,j] )
        }
        
      } else if( areas[i,j] == "South America" ){
        
        if( years[j] == 2017 ){
          if( first[i,j] == "first" ) first.sa.2017 <- c( first.sa.2017, nations[i,j] )
        } else if( years[j] == 2018 ){
          if( first[i,j] == "first" ) first.sa.2018 <- c( first.sa.2018, nations[i,j] )
        } else if( years[j] == 2019 ){
          if( first[i,j] == "first" ) first.sa.2019 <- c( first.sa.2019, nations[i,j] )
        } else if( years[j] == 2020 ){
          if( first[i,j] == "first" ) first.sa.2020 <- c( first.sa.2020, nations[i,j] )
        } else if( years[j] == 2021 ){
          if( first[i,j] == "first" ) first.sa.2021 <- c( first.sa.2021, nations[i,j] )
        } else if( years[j] == 2022 ){
          if( first[i,j] == "first" ) first.sa.2022 <- c( first.sa.2022, nations[i,j] )
        }
        
      } else if( areas[i,j] == "Europe" ){
        
        if( years[j] == 2017 ){
          if( first[i,j] == "first" ) first.eu.2017 <- c( first.eu.2017, nations[i,j] )
        } else if( years[j] == 2018 ){
          if( first[i,j] == "first" ) first.eu.2018 <- c( first.eu.2018, nations[i,j] )
        } else if( years[j] == 2019 ){
          if( first[i,j] == "first" ) first.eu.2019 <- c( first.eu.2019, nations[i,j] )
        } else if( years[j] == 2020 ){
          if( first[i,j] == "first" ) first.eu.2020 <- c( first.eu.2020, nations[i,j] )
        } else if( years[j] == 2021 ){
          if( first[i,j] == "first" ) first.eu.2021 <- c( first.eu.2021, nations[i,j] )
        } else if( years[j] == 2022 ){
          if( first[i,j] == "first" ) first.eu.2022 <- c( first.eu.2022, nations[i,j] )
        }
        
      } else if( areas[i,j] == "Africa" ){
        
        if( years[j] == 2017 ){
          if( first[i,j] == "first" ) first.af.2017 <- c( first.af.2017, nations[i,j] )
        } else if( years[j] == 2018 ){
          if( first[i,j] == "first" ) first.af.2018 <- c( first.af.2018, nations[i,j] )
        } else if( years[j] == 2019 ){
          if( first[i,j] == "first" ) first.af.2019 <- c( first.af.2019, nations[i,j] )
        } else if( years[j] == 2020 ){
          if( first[i,j] == "first" ) first.af.2020 <- c( first.af.2020, nations[i,j] )
        } else if( years[j] == 2021 ){
          if( first[i,j] == "first" ) first.af.2021 <- c( first.af.2021, nations[i,j] )
        } else if( years[j] == 2022 ){
          if( first[i,j] == "first" ) first.af.2022 <- c( first.af.2022, nations[i,j] )
        }
        
      } else if( areas[i,j] == "Oceania" ){
        
        if( years[j] == 2017 ){
          if( first[i,j] == "first" ) first.oc.2017 <- c( first.oc.2017, nations[i,j] )
        } else if( years[j] == 2018 ){
          if( first[i,j] == "first" ) first.oc.2018 <- c( first.oc.2018, nations[i,j] )
        } else if( years[j] == 2019 ){
          if( first[i,j] == "first" ) first.oc.2019 <- c( first.oc.2019, nations[i,j] )
        } else if( years[j] == 2020 ){
          if( first[i,j] == "first" ) first.oc.2020 <- c( first.oc.2020, nations[i,j] )
        } else if( years[j] == 2021 ){
          if( first[i,j] == "first" ) first.oc.2021 <- c( first.oc.2021, nations[i,j] )
        } else if( years[j] == 2022 ){
          if( first[i,j] == "first" ) first.oc.2022 <- c( first.oc.2022, nations[i,j] )
        }
        
      } else if( areas[i,j] == "Middle East Asia" ){
        
        if( years[j] == 2017 ){
          if( first[i,j] == "first" ) first.mea.2017 <- c( first.mea.2017, nations[i,j] )
        } else if( years[j] == 2018 ){
          if( first[i,j] == "first" ) first.mea.2018 <- c( first.mea.2018, nations[i,j] )
        } else if( years[j] == 2019 ){
          if( first[i,j] == "first" ) first.mea.2019 <- c( first.mea.2019, nations[i,j] )
        } else if( years[j] == 2020 ){
          if( first[i,j] == "first" ) first.mea.2020 <- c( first.mea.2020, nations[i,j] )
        } else if( years[j] == 2021 ){
          if( first[i,j] == "first" ) first.mea.2021 <- c( first.mea.2021, nations[i,j] )
        } else if( years[j] == 2022 ){
          if( first[i,j] == "first" ) first.mea.2022 <- c( first.mea.2022, nations[i,j] )
        }
        
      } else if( areas[i,j] == "East Asia" ){
        
        if( years[j] == 2017 ){
          if( first[i,j] == "first" ) first.ea.2017 <- c( first.ea.2017, nations[i,j] )
        } else if( years[j] == 2018 ){
          if( first[i,j] == "first" ) first.ea.2018 <- c( first.ea.2018, nations[i,j] )
        } else if( years[j] == 2019 ){
          if( first[i,j] == "first" ) first.ea.2019 <- c( first.ea.2019, nations[i,j] )
        } else if( years[j] == 2020 ){
          if( first[i,j] == "first" ) first.ea.2020 <- c( first.ea.2020, nations[i,j] )
        } else if( years[j] == 2021 ){
          if( first[i,j] == "first" ) first.ea.2021 <- c( first.ea.2021, nations[i,j] )
        } else if( years[j] == 2022 ){
          if( first[i,j] == "first" ) first.ea.2022 <- c( first.ea.2022, nations[i,j] )
        }
        
      } else if( areas[i,j] == "Russia" ){
        
        if( years[j] == 2017 ){
          if( first[i,j] == "first" ) first.ru.2017 <- c( first.ru.2017, nations[i,j] )
        } else if( years[j] == 2018 ){
          if( first[i,j] == "first" ) first.ru.2018 <- c( first.ru.2018, nations[i,j] )
        } else if( years[j] == 2019 ){
          if( first[i,j] == "first" ) first.ru.2019 <- c( first.ru.2019, nations[i,j] )
        } else if( years[j] == 2020 ){
          if( first[i,j] == "first" ) first.ru.2020 <- c( first.ru.2020, nations[i,j] )
        } else if( years[j] == 2021 ){
          if( first[i,j] == "first" ) first.ru.2021 <- c( first.ru.2021, nations[i,j] )
        } else if( years[j] == 2022 ){
          if( first[i,j] == "first" ) first.ru.2022 <- c( first.ru.2022, nations[i,j] )
        }
        
      } else{
        #print( paste( paste("j =",as.character(j)), paste("i =",as.character(i)) ) )
        if( years[j] == 2017 ){
          if( first[i,j] == "first" ) first.other.2017 <- c( first.other.2017, nations[i,j] )
        } else if( years[j] == 2018 ){
          if( first[i,j] == "first" ) first.other.2018 <- c( first.other.2018, nations[i,j] )
        } else if( years[j] == 2019 ){
          if( first[i,j] == "first" ) first.other.2019 <- c( first.other.2019, nations[i,j] )
        } else if( years[j] == 2020 ){
          if( first[i,j] == "first" ) first.other.2020 <- c( first.other.2020, nations[i,j] )
        } else if( years[j] == 2021 ){
          if( first[i,j] == "first" ) first.other.2021 <- c( first.other.2021, nations[i,j] )
        } else if( years[j] == 2022 ){
          if( first[i,j] == "first" ) first.other.2022 <- c( first.other.2022, nations[i,j] )
        }
      }
    }
  }
}

###--- selecting nations ---###
library(reshape2)
library("openxlsx")
# north america
for ( i in 1:length(usa) ) {
  first.na.2017[ which( first.na.2017==usa[i] ) ] = "USA"
  first.na.2018[ which( first.na.2018==usa[i] ) ] = "USA"
  first.na.2019[ which( first.na.2019==usa[i] ) ] = "USA"
  first.na.2020[ which( first.na.2020==usa[i] ) ] = "USA"
  first.na.2021[ which( first.na.2021==usa[i] ) ] = "USA"
  first.na.2022[ which( first.na.2022==usa[i] ) ] = "USA"
}

count.first.na.2017 <- cbind( 
  t( t( unique(first.na.2017) ) ),
  matrix( sapply(unique(first.na.2017), function(x){sum(first.na.2017==x)}) )
)
count.first.na.2018 <- cbind( 
  t( t( unique(first.na.2018) ) ),
  matrix( sapply(unique(first.na.2018), function(x){sum(first.na.2018==x)}) )
)
count.first.na.2019 <- cbind( 
  t( t( unique(first.na.2019) ) ),
  matrix( sapply(unique(first.na.2019), function(x){sum(first.na.2019==x)}) )
)
count.first.na.2020 <- cbind( 
  t( t( unique(first.na.2020) ) ),
  matrix( sapply(unique(first.na.2020), function(x){sum(first.na.2020==x)}) )
)
count.first.na.2021 <- cbind( 
  t( t( unique(first.na.2021) ) ),
  matrix( sapply(unique(first.na.2021), function(x){sum(first.na.2021==x)}) )
)
count.first.na.2022 <- cbind( 
  t( t( unique(first.na.2022) ) ),
  matrix( sapply(unique(first.na.2022), function(x){sum(first.na.2022==x)}) )
)

count.first.na <- full_join( data.frame(count.first.na.2017), data.frame(count.first.na.2018), by="X1" ) %>% 
  full_join( data.frame(count.first.na.2019), by="X1" ) %>%
  full_join( data.frame(count.first.na.2020), by="X1" ) %>%
  full_join( data.frame(count.first.na.2021), by="X1" ) %>%
  full_join( data.frame(count.first.na.2022), by="X1" )
colnames( count.first.na ) <- c("Nation","2017","2018","2019","2020","2021","2022")

# south america
brazil<-c("Brazil","Brasil"); mexico<-c("Mexico", "México"); panama<-c("Panama","Panamá"); peru<-c("Peru","Perú")

first.sa.2017[ which( first.sa.2017=="Brasil" ) ] = "Brazil"
first.sa.2018[ which( first.sa.2018=="Brasil" ) ] = "Brazil"
first.sa.2019[ which( first.sa.2019=="Brasil" ) ] = "Brazil"
first.sa.2020[ which( first.sa.2020=="Brasil" ) ] = "Brazil"
first.sa.2021[ which( first.sa.2021=="Brasil" ) ] = "Brazil"
first.sa.2022[ which( first.sa.2022=="Brasil" ) ] = "Brazil"

first.sa.2017[ which( first.sa.2017=="México" ) ] = "Mexico"
first.sa.2018[ which( first.sa.2018=="México" ) ] = "Mexico"
first.sa.2019[ which( first.sa.2019=="México" ) ] = "Mexico"
first.sa.2020[ which( first.sa.2020=="México" ) ] = "Mexico"
first.sa.2021[ which( first.sa.2021=="México" ) ] = "Mexico"
first.sa.2022[ which( first.sa.2022=="México" ) ] = "Mexico"

first.sa.2017[ which( first.sa.2017=="Panamá" ) ] = "Panama"
first.sa.2018[ which( first.sa.2018=="Panamá" ) ] = "Panama"
first.sa.2019[ which( first.sa.2019=="Panamá" ) ] = "Panama"
first.sa.2020[ which( first.sa.2020=="Panamá" ) ] = "Panama"
first.sa.2021[ which( first.sa.2021=="Panamá" ) ] = "Panama"
first.sa.2022[ which( first.sa.2022=="Panamá" ) ] = "Panama"

first.sa.2017[ which( first.sa.2017=="Perú" ) ] = "Peru"
first.sa.2018[ which( first.sa.2018=="Perú" ) ] = "Peru"
first.sa.2019[ which( first.sa.2019=="Perú" ) ] = "Peru"
first.sa.2020[ which( first.sa.2020=="Perú" ) ] = "Peru"
first.sa.2021[ which( first.sa.2021=="Perú" ) ] = "Peru"
first.sa.2022[ which( first.sa.2022=="Perú" ) ] = "Peru"

count.first.sa.2017 <- cbind( 
  t( t( unique(first.sa.2017) ) ),
  matrix( sapply(unique(first.sa.2017), function(x){sum(first.sa.2017==x)}) )
)
count.first.sa.2018 <- cbind( 
  t( t( unique(first.sa.2018) ) ),
  matrix( sapply(unique(first.sa.2018), function(x){sum(first.sa.2018==x)}) )
)
count.first.sa.2019 <- cbind( 
  t( t( unique(first.sa.2019) ) ),
  matrix( sapply(unique(first.sa.2019), function(x){sum(first.sa.2019==x)}) )
)
count.first.sa.2020 <- cbind( 
  t( t( unique(first.sa.2020) ) ),
  matrix( sapply(unique(first.sa.2020), function(x){sum(first.sa.2020==x)}) )
)
count.first.sa.2021 <- cbind( 
  t( t( unique(first.sa.2021) ) ),
  matrix( sapply(unique(first.sa.2021), function(x){sum(first.sa.2021==x)}) )
)
count.first.sa.2022 <- cbind( 
  t( t( unique(first.sa.2022) ) ),
  matrix( sapply(unique(first.sa.2022), function(x){sum(first.sa.2022==x)}) )
)

count.first.sa <- full_join( data.frame(count.first.sa.2017), data.frame(count.first.sa.2018), by="X1" ) %>% 
  full_join( data.frame(count.first.sa.2019), by="X1" ) %>%
  full_join( data.frame(count.first.sa.2020), by="X1" ) %>%
  full_join( data.frame(count.first.sa.2021), by="X1" ) %>%
  full_join( data.frame(count.first.sa.2022), by="X1" )
colnames( count.first.sa ) <- c("Nation","2017","2018","2019","2020","2021","2022")
#colnames( count.first.sa ) <- c("Nation","2017","2018","2019","2020","2021")

# europe
for ( i in 1:length(uk) ) {
  first.eu.2017[ which( first.eu.2017==uk[i] ) ] = "UK"
  first.eu.2018[ which( first.eu.2018==uk[i] ) ] = "UK"
  first.eu.2019[ which( first.eu.2019==uk[i] ) ] = "UK"
  first.eu.2020[ which( first.eu.2020==uk[i] ) ] = "UK"
  first.eu.2021[ which( first.eu.2021==uk[i] ) ] = "UK"
  first.eu.2022[ which( first.eu.2022==uk[i] ) ] = "UK"
}

count.first.eu.2017 <- cbind( 
  t( t( unique(first.eu.2017) ) ),
  matrix( sapply(unique(first.eu.2017), function(x){sum(first.eu.2017==x)}) )
)
count.first.eu.2018 <- cbind( 
  t( t( unique(first.eu.2018) ) ),
  matrix( sapply(unique(first.eu.2018), function(x){sum(first.eu.2018==x)}) )
)
count.first.eu.2019 <- cbind( 
  t( t( unique(first.eu.2019) ) ),
  matrix( sapply(unique(first.eu.2019), function(x){sum(first.eu.2019==x)}) )
)
count.first.eu.2020 <- cbind( 
  t( t( unique(first.eu.2020) ) ),
  matrix( sapply(unique(first.eu.2020), function(x){sum(first.eu.2020==x)}) )
)
count.first.eu.2021 <- cbind( 
  t( t( unique(first.eu.2021) ) ),
  matrix( sapply(unique(first.eu.2021), function(x){sum(first.eu.2021==x)}) )
)
count.first.eu.2022 <- cbind( 
  t( t( unique(first.eu.2022) ) ),
  matrix( sapply(unique(first.eu.2022), function(x){sum(first.eu.2022==x)}) )
)

count.first.eu <- full_join( data.frame(count.first.eu.2017), data.frame(count.first.eu.2018), by="X1" ) %>% 
  full_join( data.frame(count.first.eu.2019), by="X1" ) %>%
  full_join( data.frame(count.first.eu.2020), by="X1" ) %>%
  full_join( data.frame(count.first.eu.2021), by="X1" ) %>%
  full_join( data.frame(count.first.eu.2022), by="X1" )
colnames( count.first.eu ) <- c("Nation","2017","2018","2019","2020","2021","2022")

# africa
count.first.af.2017 <- cbind( 
  t( t( unique(first.af.2017) ) ),
  matrix( sapply(unique(first.af.2017), function(x){sum(first.af.2017==x)}) )
)
count.first.af.2018 <- cbind( 
  t( t( unique(first.af.2018) ) ),
  matrix( sapply(unique(first.af.2018), function(x){sum(first.af.2018==x)}) )
)
count.first.af.2019 <- cbind( 
  t( t( unique(first.af.2019) ) ),
  matrix( sapply(unique(first.af.2019), function(x){sum(first.af.2019==x)}) )
)
count.first.af.2020 <- cbind( 
  t( t( unique(first.af.2020) ) ),
  matrix( sapply(unique(first.af.2020), function(x){sum(first.af.2020==x)}) )
)
count.first.af.2021 <- cbind( 
  t( t( unique(first.af.2021) ) ),
  matrix( sapply(unique(first.af.2021), function(x){sum(first.af.2021==x)}) )
)
count.first.af.2022 <- cbind( 
  t( t( unique(first.af.2022) ) ),
  matrix( sapply(unique(first.af.2022), function(x){sum(first.af.2022==x)}) )
)

count.first.af <- full_join( data.frame(count.first.af.2017), data.frame(count.first.af.2018), by="X1" ) %>% 
  full_join( data.frame(count.first.af.2019), by="X1" ) %>%
  full_join( data.frame(count.first.af.2020), by="X1" ) %>%
  full_join( data.frame(count.first.af.2021), by="X1" ) %>%
  full_join( data.frame(count.first.af.2022), by="X1" )
colnames( count.first.af ) <- c("Nation","2017","2018","2019","2020","2021","2022")
#colnames( count.first.af ) <- c("Nation","2017","2018","2019","2020","2022")

# oceania
first.oc.2017[ which( first.oc.2017=="Queensland" ) ] = "Australia"
first.oc.2018[ which( first.oc.2018=="Queensland" ) ] = "Australia"
first.oc.2019[ which( first.oc.2019=="Queensland" ) ] = "Australia"
first.oc.2020[ which( first.oc.2020=="Queensland" ) ] = "Australia"
first.oc.2021[ which( first.oc.2021=="Queensland" ) ] = "Australia"
first.oc.2022[ which( first.oc.2022=="Queensland" ) ] = "Australia"

first.oc.2017[ which( first.oc.2017=="New South Wales" ) ] = "Australia"
first.oc.2018[ which( first.oc.2018=="New South Wales" ) ] = "Australia"
first.oc.2019[ which( first.oc.2019=="New South Wales" ) ] = "Australia"
first.oc.2020[ which( first.oc.2020=="New South Wales" ) ] = "Australia"
first.oc.2021[ which( first.oc.2021=="New South Wales" ) ] = "Australia"
first.oc.2022[ which( first.oc.2022=="New South Wales" ) ] = "Australia"

count.first.oc.2017 <- cbind( 
  t( t( unique(first.oc.2017) ) ),
  matrix( sapply(unique(first.oc.2017), function(x){sum(first.oc.2017==x)}) )
)
count.first.oc.2018 <- cbind( 
  t( t( unique(first.oc.2018) ) ),
  matrix( sapply(unique(first.oc.2018), function(x){sum(first.oc.2018==x)}) )
)
count.first.oc.2019 <- cbind( 
  t( t( unique(first.oc.2019) ) ),
  matrix( sapply(unique(first.oc.2019), function(x){sum(first.oc.2019==x)}) )
)
count.first.oc.2020 <- cbind( 
  t( t( unique(first.oc.2020) ) ),
  matrix( sapply(unique(first.oc.2020), function(x){sum(first.oc.2020==x)}) )
)
count.first.oc.2021 <- cbind( 
  t( t( unique(first.oc.2021) ) ),
  matrix( sapply(unique(first.oc.2021), function(x){sum(first.oc.2021==x)}) )
)
count.first.oc.2022 <- cbind( 
  t( t( unique(first.oc.2022) ) ),
  matrix( sapply(unique(first.oc.2022), function(x){sum(first.oc.2022==x)}) )
)

count.first.oc <- full_join( data.frame(count.first.oc.2017), data.frame(count.first.oc.2018), by="X1" ) %>% 
  full_join( data.frame(count.first.oc.2019), by="X1" ) %>%
  full_join( data.frame(count.first.oc.2020), by="X1" ) %>%
  full_join( data.frame(count.first.oc.2021), by="X1" ) %>%
  full_join( data.frame(count.first.oc.2022), by="X1" )
colnames( count.first.oc ) <- c("Nation","2017","2018","2019","2020","2021","2022")

# middle east asia
count.first.mea.2017 <- cbind( 
  t( t( unique(first.mea.2017) ) ),
  matrix( sapply(unique(first.mea.2017), function(x){sum(first.mea.2017==x)}) )
)
count.first.mea.2018 <- cbind( 
  t( t( unique(first.mea.2018) ) ),
  matrix( sapply(unique(first.mea.2018), function(x){sum(first.mea.2018==x)}) )
)
count.first.mea.2019 <- cbind( 
  t( t( unique(first.mea.2019) ) ),
  matrix( sapply(unique(first.mea.2019), function(x){sum(first.mea.2019==x)}) )
)
count.first.mea.2020 <- cbind( 
  t( t( unique(first.mea.2020) ) ),
  matrix( sapply(unique(first.mea.2020), function(x){sum(first.mea.2020==x)}) )
)
count.first.mea.2021 <- cbind( 
  t( t( unique(first.mea.2021) ) ),
  matrix( sapply(unique(first.mea.2021), function(x){sum(first.mea.2021==x)}) )
)
count.first.mea.2022 <- cbind( 
  t( t( unique(first.mea.2022) ) ),
  matrix( sapply(unique(first.mea.2022), function(x){sum(first.mea.2022==x)}) )
)

count.first.mea <- full_join( data.frame(count.first.mea.2017), data.frame(count.first.mea.2018), by="X1" ) %>% 
  full_join( data.frame(count.first.mea.2019), by="X1" ) %>%
  full_join( data.frame(count.first.mea.2020), by="X1" ) %>%
  full_join( data.frame(count.first.mea.2021), by="X1" ) %>%
  full_join( data.frame(count.first.mea.2022), by="X1" )
colnames( count.first.mea ) <- c("Nation","2017","2018","2019","2020","2021","2022")

# east asia
count.first.ea.2017 <- cbind( 
  t( t( unique(first.ea.2017) ) ),
  matrix( sapply(unique(first.ea.2017), function(x){sum(first.ea.2017==x)}) )
)
count.first.ea.2018 <- cbind( 
  t( t( unique(first.ea.2018) ) ),
  matrix( sapply(unique(first.ea.2018), function(x){sum(first.ea.2018==x)}) )
)
count.first.ea.2019 <- cbind( 
  t( t( unique(first.ea.2019) ) ),
  matrix( sapply(unique(first.ea.2019), function(x){sum(first.ea.2019==x)}) )
)
count.first.ea.2020 <- cbind( 
  t( t( unique(first.ea.2020) ) ),
  matrix( sapply(unique(first.ea.2020), function(x){sum(first.ea.2020==x)}) )
)
count.first.ea.2021 <- cbind( 
  t( t( unique(first.ea.2021) ) ),
  matrix( sapply(unique(first.ea.2021), function(x){sum(first.ea.2021==x)}) )
)
count.first.ea.2022 <- cbind( 
  t( t( unique(first.ea.2022) ) ),
  matrix( sapply(unique(first.ea.2022), function(x){sum(first.ea.2022==x)}) )
)

count.first.ea <- full_join( data.frame(count.first.ea.2017), data.frame(count.first.ea.2018), by="X1" ) %>% 
  full_join( data.frame(count.first.ea.2019), by="X1" ) %>%
  full_join( data.frame(count.first.ea.2020), by="X1" ) %>%
  full_join( data.frame(count.first.ea.2021), by="X1" ) %>%
  full_join( data.frame(count.first.ea.2022), by="X1" )
colnames( count.first.ea ) <- c("Nation","2017","2018","2019","2020","2021","2022")
colnames( count.first.ea ) <- c("Nation","2017","2018","2020","2021","2022")

# russia
count.first.ru.2017 <- cbind( 
  rep( "2017", length=length(unique(first.ru.2017)) ), 
  unique(first.ru.2017), 
  matrix( sapply(unique(first.ru.2017), function(x){sum(first.ru.2017==x)}) ) 
) 
count.first.ru.2018 <- cbind( 
  rep( "2018", length=length(unique(first.ru.2018)) ), 
  unique(first.ru.2018), 
  matrix( sapply(unique(first.ru.2018), function(x){sum(first.ru.2018==x)}) ) 
) 
count.first.ru.2019 <- cbind( 
  rep( "2019", length=length(unique(first.ru.2019)) ), 
  unique(first.ru.2019), 
  matrix( sapply(unique(first.ru.2019), function(x){sum(first.ru.2019==x)}) ) 
) 
count.first.ru.2020 <- cbind( 
  rep( "2020", length=length(unique(first.ru.2020)) ), 
  unique(first.ru.2020), 
  matrix( sapply(unique(first.ru.2020), function(x){sum(first.ru.2020==x)}) ) 
) 
count.first.ru.2021 <- cbind( 
  rep( "2021", length=length(unique(first.ru.2021)) ), 
  unique(first.ru.2021), 
  matrix( sapply(unique(first.ru.2021), function(x){sum(first.ru.2021==x)}) ) 
) 
count.first.ru.2022 <- cbind( 
  rep( "2022", length=length(unique(first.ru.2022)) ), 
  unique(first.ru.2022), 
  matrix( sapply(unique(first.ru.2022), function(x){sum(first.ru.2022==x)}) ) 
) 

count.first.ru <- data.frame(
  rbind(
    count.first.ru.2017,
    count.first.ru.2018,
    count.first.ru.2019,
    count.first.ru.2020,
    count.first.ru.2021,
    count.first.ru.2022
  )
)
colnames( count.first.ru ) <- c("duration","Nation","count")

# other
count.first.other.2017 <- cbind( 
  rep( "2017", length=length(unique(first.other.2017)) ), 
  unique(first.other.2017), 
  matrix( sapply(unique(first.other.2017), function(x){sum(first.other.2017==x)}) ) 
) 
count.first.other.2018 <- cbind( 
  rep( "2018", length=length(unique(first.other.2018)) ), 
  unique(first.other.2018), 
  matrix( sapply(unique(first.other.2018), function(x){sum(first.other.2018==x)}) ) 
) 
count.first.other.2019 <- cbind( 
  rep( "2019", length=length(unique(first.other.2019)) ), 
  unique(first.other.2019), 
  matrix( sapply(unique(first.other.2019), function(x){sum(first.other.2019==x)}) ) 
) 
count.first.other.2020 <- cbind( 
  rep( "2020", length=length(unique(first.other.2020)) ), 
  unique(first.other.2020), 
  matrix( sapply(unique(first.other.2020), function(x){sum(first.other.2020==x)}) ) 
) 
count.first.other.2021 <- cbind( 
  rep( "2021", length=length(unique(first.other.2021)) ), 
  unique(first.other.2021), 
  matrix( sapply(unique(first.other.2021), function(x){sum(first.other.2021==x)}) ) 
) 
count.first.other.2022 <- cbind( 
  rep( "2022", length=length(unique(first.other.2022)) ), 
  unique(first.other.2022), 
  matrix( sapply(unique(first.other.2022), function(x){sum(first.other.2022==x)}) ) 
) 

count.first.other <- data.frame(
  rbind(
    count.first.other.2017,
    count.first.other.2018,
    count.first.other.2019,
    count.first.other.2020,
    count.first.other.2021,
    count.first.other.2022
  )
)
colnames( count.first.other ) <- c("duration","Nation","count")

# wtite ecxel sheets
count.first.na[is.na(count.first.na)] = 0
count.first.sa[is.na(count.first.sa)] = 0
count.first.eu[is.na(count.first.eu)] = 0
count.first.af[is.na(count.first.af)] = 0
count.first.oc[is.na(count.first.oc)] = 0
count.first.mea[is.na(count.first.mea)] = 0
count.first.ea[is.na(count.first.ea)] = 0
count.first.ru[is.na(count.first.ru)] = 0
count.first.other[is.na(count.first.other)] = 0

sheetList<-list("north_america"=count.first.na, 
                "south_america"=count.first.sa, 
                "europe"=count.first.eu, 
                "africa"=count.first.af, 
                "oceania"=count.first.oc, 
                "middle_east_asia"=count.first.mea, 
                "east_asia"=count.first.ea, 
                "russia"=count.first.ru, 
                "other"=count.first.other
)

# write.xlsx( sheetList, paste("count.first.year-",".xlsx",sep=journal.dir) )
