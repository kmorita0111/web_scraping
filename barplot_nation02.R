###=== nations a year ===###
nations.na.2017 <- c(); nations.na.2018 <- c(); nations.na.2019 <- c(); nations.na.2020 <- c(); nations.na.2021 <- c(); nations.na.2022 <- c()
nations.sa.2017 <- c(); nations.sa.2018 <- c(); nations.sa.2019 <- c(); nations.sa.2020 <- c(); nations.sa.2021 <- c(); nations.sa.2022 <- c()
nations.eu.2017 <- c(); nations.eu.2018 <- c(); nations.eu.2019 <- c(); nations.eu.2020 <- c(); nations.eu.2021 <- c(); nations.eu.2022 <- c()
nations.af.2017 <- c(); nations.af.2018 <- c(); nations.af.2019 <- c(); nations.af.2020 <- c(); nations.af.2021 <- c(); nations.af.2022 <- c()
nations.oc.2017 <- c(); nations.oc.2018 <- c(); nations.oc.2019 <- c(); nations.oc.2020 <- c(); nations.oc.2021 <- c(); nations.oc.2022 <- c()
nations.mea.2017 <- c(); nations.mea.2018 <- c(); nations.mea.2019 <- c(); nations.mea.2020 <- c(); nations.mea.2021 <- c(); nations.mea.2022 <- c()
nations.ea.2017 <- c(); nations.ea.2018 <- c(); nations.ea.2019 <- c(); nations.ea.2020 <- c(); nations.ea.2021 <- c(); nations.ea.2022 <- c()
nations.ru.2017 <- c(); nations.ru.2018 <- c(); nations.ru.2019 <- c(); nations.ru.2020 <- c(); nations.ru.2021 <- c(); nations.ru.2022 <- c()
nations.other.2017 <- c(); nations.other.2018 <- c(); nations.other.2019 <- c(); nations.other.2020 <- c(); nations.other.2021 <- c(); nations.other.2022 <- c()

for ( j in 1:ncol( areas ) ) {
  for ( i in 1:nrow( areas ) ) {
    if( !is.na( areas[i,j] ) ){
      if( areas[i,j] == "North America" ){
        
        if( years[j] == 2017 ){
          nations.na.2017 <- c( nations.na.2017, nations[i,j] )
        } else if( years[j] == 2018 ){
          nations.na.2018 <- c( nations.na.2018, nations[i,j] )
        } else if( years[j] == 2019 ){
          nations.na.2019 <- c( nations.na.2019, nations[i,j] )
        } else if( years[j] == 2020 ){
          nations.na.2020 <- c( nations.na.2020, nations[i,j] )
        } else if( years[j] == 2021 ){
          nations.na.2021 <- c( nations.na.2021, nations[i,j] )
        } else if( years[j] == 2022 ){
          nations.na.2022 <- c( nations.na.2022, nations[i,j] )
        }
        
      } else if( areas[i,j] == "South America" ){
        
        if( years[j] == 2017 ){
          nations.sa.2017 <- c( nations.sa.2017, nations[i,j] )
        } else if( years[j] == 2018 ){
          nations.sa.2018 <- c( nations.sa.2018, nations[i,j] )
        } else if( years[j] == 2019 ){
          nations.sa.2019 <- c( nations.sa.2019, nations[i,j] )
        } else if( years[j] == 2020 ){
          nations.sa.2020 <- c( nations.sa.2020, nations[i,j] )
        } else if( years[j] == 2021 ){
          nations.sa.2021 <- c( nations.sa.2021, nations[i,j] )
        } else if( years[j] == 2022 ){
          nations.sa.2022 <- c( nations.sa.2022, nations[i,j] )
        }
        
      } else if( areas[i,j] == "Europe" ){
        
        if( years[j] == 2017 ){
          nations.eu.2017 <- c( nations.eu.2017, nations[i,j] )
        } else if( years[j] == 2018 ){
          nations.eu.2018 <- c( nations.eu.2018, nations[i,j] )
        } else if( years[j] == 2019 ){
          nations.eu.2019 <- c( nations.eu.2019, nations[i,j] )
        } else if( years[j] == 2020 ){
          nations.eu.2020 <- c( nations.eu.2020, nations[i,j] )
        } else if( years[j] == 2021 ){
          nations.eu.2021 <- c( nations.eu.2021, nations[i,j] )
        } else if( years[j] == 2022 ){
          nations.eu.2022 <- c( nations.eu.2022, nations[i,j] )
        }
        
      } else if( areas[i,j] == "Africa" ){
        
        if( years[j] == 2017 ){
          nations.af.2017 <- c( nations.af.2017, nations[i,j] )
        } else if( years[j] == 2018 ){
          nations.af.2018 <- c( nations.af.2018, nations[i,j] )
        } else if( years[j] == 2019 ){
          nations.af.2019 <- c( nations.af.2019, nations[i,j] )
        } else if( years[j] == 2020 ){
          nations.af.2020 <- c( nations.af.2020, nations[i,j] )
        } else if( years[j] == 2021 ){
          nations.af.2021 <- c( nations.af.2021, nations[i,j] )
        } else if( years[j] == 2022 ){
          nations.af.2022 <- c( nations.af.2022, nations[i,j] )
        }
        
      } else if( areas[i,j] == "Oceania" ){
        
        if( years[j] == 2017 ){
          nations.oc.2017 <- c( nations.oc.2017, nations[i,j] )
        } else if( years[j] == 2018 ){
          nations.oc.2018 <- c( nations.oc.2018, nations[i,j] )
        } else if( years[j] == 2019 ){
          nations.oc.2019 <- c( nations.oc.2019, nations[i,j] )
        } else if( years[j] == 2020 ){
          nations.oc.2020 <- c( nations.oc.2020, nations[i,j] )
        } else if( years[j] == 2021 ){
          nations.oc.2021 <- c( nations.oc.2021, nations[i,j] )
        } else if( years[j] == 2022 ){
          nations.oc.2022 <- c( nations.oc.2022, nations[i,j] )
        }
        
      } else if( areas[i,j] == "Middle East Asia" ){
        
        if( years[j] == 2017 ){
          nations.mea.2017 <- c( nations.mea.2017, nations[i,j] )
        } else if( years[j] == 2018 ){
          nations.mea.2018 <- c( nations.mea.2018, nations[i,j] )
        } else if( years[j] == 2019 ){
          nations.mea.2019 <- c( nations.mea.2019, nations[i,j] )
        } else if( years[j] == 2020 ){
          nations.mea.2020 <- c( nations.mea.2020, nations[i,j] )
        } else if( years[j] == 2021 ){
          nations.mea.2021 <- c( nations.mea.2021, nations[i,j] )
        } else if( years[j] == 2022 ){
          nations.mea.2022 <- c( nations.mea.2022, nations[i,j] )
        }
        
      } else if( areas[i,j] == "East Asia" ){
        
        if( years[j] == 2017 ){
          nations.ea.2017 <- c( nations.ea.2017, nations[i,j] )
        } else if( years[j] == 2018 ){
          nations.ea.2018 <- c( nations.ea.2018, nations[i,j] )
        } else if( years[j] == 2019 ){
          nations.ea.2019 <- c( nations.ea.2019, nations[i,j] )
        } else if( years[j] == 2020 ){
          nations.ea.2020 <- c( nations.ea.2020, nations[i,j] )
        } else if( years[j] == 2021 ){
          nations.ea.2021 <- c( nations.ea.2021, nations[i,j] )
        } else if( years[j] == 2022 ){
          nations.ea.2022 <- c( nations.ea.2022, nations[i,j] )
        }
        
      } else if( areas[i,j] == "Russia" ){
        
        if( years[j] == 2017 ){
          nations.ru.2017 <- c( nations.ru.2017, nations[i,j] )
        } else if( years[j] == 2018 ){
          nations.ru.2018 <- c( nations.ru.2018, nations[i,j] )
        } else if( years[j] == 2019 ){
          nations.ru.2019 <- c( nations.ru.2019, nations[i,j] )
        } else if( years[j] == 2020 ){
          nations.ru.2020 <- c( nations.ru.2020, nations[i,j] )
        } else if( years[j] == 2021 ){
          nations.ru.2021 <- c( nations.ru.2021, nations[i,j] )
        } else if( years[j] == 2022 ){
          nations.ru.2022 <- c( nations.ru.2022, nations[i,j] )
        }
        
      } else{
        #print( paste( paste("j =",as.character(j)), paste("i =",as.character(i)) ) )
        if( years[j] == 2017 ){
          nations.other.2017 <- c( nations.other.2017, nations[i,j] )
        } else if( years[j] == 2018 ){
          nations.other.2018 <- c( nations.other.2018, nations[i,j] )
        } else if( years[j] == 2019 ){
          nations.other.2019 <- c( nations.other.2019, nations[i,j] )
        } else if( years[j] == 2020 ){
          nations.other.2020 <- c( nations.other.2020, nations[i,j] )
        } else if( years[j] == 2021 ){
          nations.other.2021 <- c( nations.other.2021, nations[i,j] )
        } else if( years[j] == 2022 ){
          nations.other.2022 <- c( nations.other.2022, nations[i,j] )
        }
      }
    }
  }
}

###--- selecting nations ---###
library(reshape2)
library("openxlsx")
library("dplyr")

# north america
for ( i in 1:length(usa) ) {
  nations.na.2017[ which( nations.na.2017==usa[i] ) ] = "USA"
  nations.na.2018[ which( nations.na.2018==usa[i] ) ] = "USA"
  nations.na.2019[ which( nations.na.2019==usa[i] ) ] = "USA"
  nations.na.2020[ which( nations.na.2020==usa[i] ) ] = "USA"
  nations.na.2021[ which( nations.na.2021==usa[i] ) ] = "USA"
  nations.na.2022[ which( nations.na.2022==usa[i] ) ] = "USA"
}

count.nations.na.2017 <- cbind( 
  t( t( unique(nations.na.2017) ) ),
  matrix( sapply(unique(nations.na.2017), function(x){sum(nations.na.2017==x)}) )
)
count.nations.na.2018 <- cbind( 
  t( t( unique(nations.na.2018) ) ),
  matrix( sapply(unique(nations.na.2018), function(x){sum(nations.na.2018==x)}) )
)
count.nations.na.2019 <- cbind( 
  t( t( unique(nations.na.2019) ) ),
  matrix( sapply(unique(nations.na.2019), function(x){sum(nations.na.2019==x)}) )
)
count.nations.na.2020 <- cbind( 
  t( t( unique(nations.na.2020) ) ),
  matrix( sapply(unique(nations.na.2020), function(x){sum(nations.na.2020==x)}) )
)
count.nations.na.2021 <- cbind( 
  t( t( unique(nations.na.2021) ) ),
  matrix( sapply(unique(nations.na.2021), function(x){sum(nations.na.2021==x)}) )
)
count.nations.na.2022 <- cbind( 
  t( t( unique(nations.na.2022) ) ),
  matrix( sapply(unique(nations.na.2022), function(x){sum(nations.na.2022==x)}) )
)

count.nations.na <- full_join( data.frame(count.nations.na.2017), data.frame(count.nations.na.2018), by="X1" ) %>% 
  full_join( data.frame(count.nations.na.2019), by="X1" ) %>%
  full_join( data.frame(count.nations.na.2020), by="X1" ) %>%
  full_join( data.frame(count.nations.na.2021), by="X1" ) %>%
  full_join( data.frame(count.nations.na.2022), by="X1" )
colnames( count.nations.na ) <- c("Nation","2017","2018","2019","2020","2021","2022")

# south america
nations.sa.2017[ which( nations.sa.2017=="Brasil" ) ] = "Brazil"
nations.sa.2018[ which( nations.sa.2018=="Brasil" ) ] = "Brazil"
nations.sa.2019[ which( nations.sa.2019=="Brasil" ) ] = "Brazil"
nations.sa.2020[ which( nations.sa.2020=="Brasil" ) ] = "Brazil"
nations.sa.2021[ which( nations.sa.2021=="Brasil" ) ] = "Brazil"
nations.sa.2022[ which( nations.sa.2022=="Brasil" ) ] = "Brazil"

nations.sa.2017[ which( nations.sa.2017=="México" ) ] = "Mexico"
nations.sa.2018[ which( nations.sa.2018=="México" ) ] = "Mexico"
nations.sa.2019[ which( nations.sa.2019=="México" ) ] = "Mexico"
nations.sa.2020[ which( nations.sa.2020=="México" ) ] = "Mexico"
nations.sa.2021[ which( nations.sa.2021=="México" ) ] = "Mexico"
nations.sa.2022[ which( nations.sa.2022=="México" ) ] = "Mexico"

nations.sa.2017[ which( nations.sa.2017=="Panamá" ) ] = "Panama"
nations.sa.2018[ which( nations.sa.2018=="Panamá" ) ] = "Panama"
nations.sa.2019[ which( nations.sa.2019=="Panamá" ) ] = "Panama"
nations.sa.2020[ which( nations.sa.2020=="Panamá" ) ] = "Panama"
nations.sa.2021[ which( nations.sa.2021=="Panamá" ) ] = "Panama"
nations.sa.2022[ which( nations.sa.2022=="Panamá" ) ] = "Panama"

nations.sa.2017[ which( nations.sa.2017=="Perú" ) ] = "Peru"
nations.sa.2018[ which( nations.sa.2018=="Perú" ) ] = "Peru"
nations.sa.2019[ which( nations.sa.2019=="Perú" ) ] = "Peru"
nations.sa.2020[ which( nations.sa.2020=="Perú" ) ] = "Peru"
nations.sa.2021[ which( nations.sa.2021=="Perú" ) ] = "Peru"
nations.sa.2022[ which( nations.sa.2022=="Perú" ) ] = "Peru"

count.nations.sa.2017 <- cbind( 
  t( t( unique(nations.sa.2017) ) ),
  matrix( sapply(unique(nations.sa.2017), function(x){sum(nations.sa.2017==x)}) )
)
count.nations.sa.2018 <- cbind( 
  t( t( unique(nations.sa.2018) ) ),
  matrix( sapply(unique(nations.sa.2018), function(x){sum(nations.sa.2018==x)}) )
)
count.nations.sa.2019 <- cbind( 
  t( t( unique(nations.sa.2019) ) ),
  matrix( sapply(unique(nations.sa.2019), function(x){sum(nations.sa.2019==x)}) )
)
count.nations.sa.2020 <- cbind( 
  t( t( unique(nations.sa.2020) ) ),
  matrix( sapply(unique(nations.sa.2020), function(x){sum(nations.sa.2020==x)}) )
)
count.nations.sa.2021 <- cbind( 
  t( t( unique(nations.sa.2021) ) ),
  matrix( sapply(unique(nations.sa.2021), function(x){sum(nations.sa.2021==x)}) )
)
count.nations.sa.2022 <- cbind( 
  t( t( unique(nations.sa.2022) ) ),
  matrix( sapply(unique(nations.sa.2022), function(x){sum(nations.sa.2022==x)}) )
)

count.nations.sa <- full_join( data.frame(count.nations.sa.2017), data.frame(count.nations.sa.2018), by="X1" ) %>% 
  full_join( data.frame(count.nations.sa.2019), by="X1" ) %>%
  full_join( data.frame(count.nations.sa.2020), by="X1" ) %>%
  full_join( data.frame(count.nations.sa.2021), by="X1" ) %>%
  full_join( data.frame(count.nations.sa.2022), by="X1" )
colnames( count.nations.sa ) <- c("Nation","2017","2018","2019","2020","2021","2022")

# europe
uk<-c("United Kingdom","U.K.","Cambridge","England","Edinburgh","Hampshire","Ireland","Scotland")
france <- c("Montpellier")
czech.republic <- c("Czechia")
netherlands <- c("Curaçao")
for ( i in 1:length(uk) ){
  nations.eu.2017[ which( nations.eu.2017==uk[i] ) ] = "UK"
  nations.eu.2018[ which( nations.eu.2018==uk[i] ) ] = "UK"
  nations.eu.2019[ which( nations.eu.2019==uk[i] ) ] = "UK"
  nations.eu.2020[ which( nations.eu.2020==uk[i] ) ] = "UK"
  nations.eu.2021[ which( nations.eu.2021==uk[i] ) ] = "UK"
  nations.eu.2022[ which( nations.eu.2022==uk[i] ) ] = "UK"
} 
for ( i in 1:length(france) ){
  nations.eu.2017[ which( nations.eu.2017==france[i] ) ] = "France"
  nations.eu.2018[ which( nations.eu.2018==france[i] ) ] = "France"
  nations.eu.2019[ which( nations.eu.2019==france[i] ) ] = "France"
  nations.eu.2020[ which( nations.eu.2020==france[i] ) ] = "France"
  nations.eu.2021[ which( nations.eu.2021==france[i] ) ] = "France"
  nations.eu.2022[ which( nations.eu.2022==france[i] ) ] = "France"
}
for ( i in 1:length(czech.republic) ){
  nations.eu.2017[ which( nations.eu.2017==czech.republic[i] ) ] = "Czech Republic"
  nations.eu.2018[ which( nations.eu.2018==czech.republic[i] ) ] = "Czech Republic"
  nations.eu.2019[ which( nations.eu.2019==czech.republic[i] ) ] = "Czech Republic"
  nations.eu.2020[ which( nations.eu.2020==czech.republic[i] ) ] = "Czech Republic"
  nations.eu.2021[ which( nations.eu.2021==czech.republic[i] ) ] = "Czech Republic"
  nations.eu.2022[ which( nations.eu.2022==czech.republic[i] ) ] = "Czech Republic"
}
for ( i in 1:length(netherlands) ){
  nations.eu.2017[ which( nations.eu.2017==netherlands[i] ) ] = "Netherlands"
  nations.eu.2018[ which( nations.eu.2018==netherlands[i] ) ] = "Netherlands"
  nations.eu.2019[ which( nations.eu.2019==netherlands[i] ) ] = "Netherlands"
  nations.eu.2020[ which( nations.eu.2020==netherlands[i] ) ] = "Netherlands"
  nations.eu.2021[ which( nations.eu.2021==netherlands[i] ) ] = "Netherlands"
  nations.eu.2022[ which( nations.eu.2022==netherlands[i] ) ] = "Netherlands"
}

count.nations.eu.2017 <- cbind( 
  t( t( unique(nations.eu.2017) ) ),
  matrix( sapply(unique(nations.eu.2017), function(x){sum(nations.eu.2017==x)}) )
)
count.nations.eu.2018 <- cbind( 
  t( t( unique(nations.eu.2018) ) ),
  matrix( sapply(unique(nations.eu.2018), function(x){sum(nations.eu.2018==x)}) )
)
count.nations.eu.2019 <- cbind( 
  t( t( unique(nations.eu.2019) ) ),
  matrix( sapply(unique(nations.eu.2019), function(x){sum(nations.eu.2019==x)}) )
)
count.nations.eu.2020 <- cbind( 
  t( t( unique(nations.eu.2020) ) ),
  matrix( sapply(unique(nations.eu.2020), function(x){sum(nations.eu.2020==x)}) )
)
count.nations.eu.2021 <- cbind( 
  t( t( unique(nations.eu.2021) ) ),
  matrix( sapply(unique(nations.eu.2021), function(x){sum(nations.eu.2021==x)}) )
)
count.nations.eu.2022 <- cbind( 
  t( t( unique(nations.eu.2022) ) ),
  matrix( sapply(unique(nations.eu.2022), function(x){sum(nations.eu.2022==x)}) )
)

count.nations.eu <- full_join( data.frame(count.nations.eu.2017), data.frame(count.nations.eu.2018), by="X1" ) %>% 
  full_join( data.frame(count.nations.eu.2019), by="X1" ) %>%
  full_join( data.frame(count.nations.eu.2020), by="X1" ) %>%
  full_join( data.frame(count.nations.eu.2021), by="X1" ) %>%
  full_join( data.frame(count.nations.eu.2022), by="X1" )
colnames( count.nations.eu ) <- c("Nation","2017","2018","2019","2020","2021","2022")

# africa
count.nations.af.2017 <- cbind( 
  t( t( unique(nations.af.2017) ) ),
  matrix( sapply(unique(nations.af.2017), function(x){sum(nations.af.2017==x)}) )
)
count.nations.af.2018 <- cbind( 
  t( t( unique(nations.af.2018) ) ),
  matrix( sapply(unique(nations.af.2018), function(x){sum(nations.af.2018==x)}) )
)
count.nations.af.2019 <- cbind( 
  t( t( unique(nations.af.2019) ) ),
  matrix( sapply(unique(nations.af.2019), function(x){sum(nations.af.2019==x)}) )
)
count.nations.af.2020 <- cbind( 
  t( t( unique(nations.af.2020) ) ),
  matrix( sapply(unique(nations.af.2020), function(x){sum(nations.af.2020==x)}) )
)
count.nations.af.2021 <- cbind( 
  t( t( unique(nations.af.2021) ) ),
  matrix( sapply(unique(nations.af.2021), function(x){sum(nations.af.2021==x)}) )
)
count.nations.af.2022 <- cbind( 
  t( t( unique(nations.af.2022) ) ),
  matrix( sapply(unique(nations.af.2022), function(x){sum(nations.af.2022==x)}) )
)

count.nations.af <- full_join( data.frame(count.nations.af.2017), data.frame(count.nations.af.2018), by="X1" ) %>% 
  full_join( data.frame(count.nations.af.2019), by="X1" ) %>%
  full_join( data.frame(count.nations.af.2020), by="X1" ) %>%
  full_join( data.frame(count.nations.af.2021), by="X1" ) %>%
  full_join( data.frame(count.nations.af.2022), by="X1" )
colnames( count.nations.af ) <- c("Nation","2017","2018","2019","2020","2021","2022")

# oceania
nations.oc.2017[ which( nations.oc.2017=="Queensland" ) ] = "Australia"
nations.oc.2018[ which( nations.oc.2018=="Queensland" ) ] = "Australia"
nations.oc.2019[ which( nations.oc.2019=="Queensland" ) ] = "Australia"
nations.oc.2020[ which( nations.oc.2020=="Queensland" ) ] = "Australia"
nations.oc.2021[ which( nations.oc.2021=="Queensland" ) ] = "Australia"
nations.oc.2022[ which( nations.oc.2022=="Queensland" ) ] = "Australia"

nations.oc.2017[ which( nations.oc.2017=="New South Wales" ) ] = "Australia"
nations.oc.2018[ which( nations.oc.2018=="New South Wales" ) ] = "Australia"
nations.oc.2019[ which( nations.oc.2019=="New South Wales" ) ] = "Australia"
nations.oc.2020[ which( nations.oc.2020=="New South Wales" ) ] = "Australia"
nations.oc.2021[ which( nations.oc.2021=="New South Wales" ) ] = "Australia"
nations.oc.2022[ which( nations.oc.2022=="New South Wales" ) ] = "Australia"

count.nations.oc.2017 <- cbind( 
  t( t( unique(nations.oc.2017) ) ),
  matrix( sapply(unique(nations.oc.2017), function(x){sum(nations.oc.2017==x)}) )
)
count.nations.oc.2018 <- cbind( 
  t( t( unique(nations.oc.2018) ) ),
  matrix( sapply(unique(nations.oc.2018), function(x){sum(nations.oc.2018==x)}) )
)
count.nations.oc.2019 <- cbind( 
  t( t( unique(nations.oc.2019) ) ),
  matrix( sapply(unique(nations.oc.2019), function(x){sum(nations.oc.2019==x)}) )
)
count.nations.oc.2020 <- cbind( 
  t( t( unique(nations.oc.2020) ) ),
  matrix( sapply(unique(nations.oc.2020), function(x){sum(nations.oc.2020==x)}) )
)
count.nations.oc.2021 <- cbind( 
  t( t( unique(nations.oc.2021) ) ),
  matrix( sapply(unique(nations.oc.2021), function(x){sum(nations.oc.2021==x)}) )
)
count.nations.oc.2022 <- cbind( 
  t( t( unique(nations.oc.2022) ) ),
  matrix( sapply(unique(nations.oc.2022), function(x){sum(nations.oc.2022==x)}) )
)

count.nations.oc <- full_join( data.frame(count.nations.oc.2017), data.frame(count.nations.oc.2018), by="X1" ) %>% 
  full_join( data.frame(count.nations.oc.2019), by="X1" ) %>%
  full_join( data.frame(count.nations.oc.2020), by="X1" ) %>%
  full_join( data.frame(count.nations.oc.2021), by="X1" ) %>%
  full_join( data.frame(count.nations.oc.2022), by="X1" )
colnames( count.nations.oc ) <- c("Nation","2017","2018","2019","2020","2021","2022")

# middle east asia
count.nations.mea.2017 <- cbind( 
  rep( "2017", length=length(unique(nations.mea.2017)) ), 
  unique(nations.mea.2017), 
  matrix( sapply(unique(nations.mea.2017), function(x){sum(nations.mea.2017==x)}) ) 
) 
count.nations.mea.2018 <- cbind( 
  rep( "2018", length=length(unique(nations.mea.2018)) ), 
  unique(nations.mea.2018), 
  matrix( sapply(unique(nations.mea.2018), function(x){sum(nations.mea.2018==x)}) ) 
) 
count.nations.mea.2019 <- cbind( 
  rep( "2019", length=length(unique(nations.mea.2019)) ), 
  unique(nations.mea.2019), 
  matrix( sapply(unique(nations.mea.2019), function(x){sum(nations.mea.2019==x)}) ) 
) 
count.nations.mea.2020 <- cbind( 
  rep( "2020", length=length(unique(nations.mea.2020)) ), 
  unique(nations.mea.2020), 
  matrix( sapply(unique(nations.mea.2020), function(x){sum(nations.mea.2020==x)}) ) 
) 
count.nations.mea.2021 <- cbind( 
  rep( "2021", length=length(unique(nations.mea.2021)) ), 
  unique(nations.mea.2021), 
  matrix( sapply(unique(nations.mea.2021), function(x){sum(nations.mea.2021==x)}) ) 
) 
count.nations.mea.2022 <- cbind( 
  rep( "2022", length=length(unique(nations.mea.2022)) ), 
  unique(nations.mea.2022), 
  matrix( sapply(unique(nations.mea.2022), function(x){sum(nations.mea.2022==x)}) ) 
) 

count.nations.ru <- data.frame(
  rbind(
    count.nations.mea.2017,
    count.nations.mea.2018,
    count.nations.mea.2019,
    count.nations.mea.2020,
    count.nations.mea.2021,
    count.nations.mea.2022
  )
)
colnames( count.nations.mea ) <- c("duration","Nation","count")

# east asia
count.nations.ea.2017 <- cbind( 
  t( t( unique(nations.ea.2017) ) ),
  matrix( sapply(unique(nations.ea.2017), function(x){sum(nations.ea.2017==x)}) )
)
count.nations.ea.2018 <- cbind( 
  t( t( unique(nations.ea.2018) ) ),
  matrix( sapply(unique(nations.ea.2018), function(x){sum(nations.ea.2018==x)}) )
)
count.nations.ea.2019 <- cbind( 
  t( t( unique(nations.ea.2019) ) ),
  matrix( sapply(unique(nations.ea.2019), function(x){sum(nations.ea.2019==x)}) )
)
count.nations.ea.2020 <- cbind( 
  t( t( unique(nations.ea.2020) ) ),
  matrix( sapply(unique(nations.ea.2020), function(x){sum(nations.ea.2020==x)}) )
)
count.nations.ea.2021 <- cbind( 
  t( t( unique(nations.ea.2021) ) ),
  matrix( sapply(unique(nations.ea.2021), function(x){sum(nations.ea.2021==x)}) )
)
count.nations.ea.2022 <- cbind( 
  t( t( unique(nations.ea.2022) ) ),
  matrix( sapply(unique(nations.ea.2022), function(x){sum(nations.ea.2022==x)}) )
)

count.nations.ea <- full_join( data.frame(count.nations.ea.2017), data.frame(count.nations.ea.2018), by="X1" ) %>% 
  full_join( data.frame(count.nations.ea.2019), by="X1" ) %>%
  full_join( data.frame(count.nations.ea.2020), by="X1" ) %>%
  full_join( data.frame(count.nations.ea.2021), by="X1" ) %>%
  full_join( data.frame(count.nations.ea.2022), by="X1" )
colnames( count.nations.ea ) <- c("Nation","2017","2018","2019","2020","2021","2022")

# russia
count.nations.ru.2017 <- cbind( 
  rep( "2017", length=length(unique(nations.ru.2017)) ), 
  unique(nations.ru.2017), 
  matrix( sapply(unique(nations.ru.2017), function(x){sum(nations.ru.2017==x)}) ) 
) 
count.nations.ru.2018 <- cbind( 
  rep( "2018", length=length(unique(nations.ru.2018)) ), 
  unique(nations.ru.2018), 
  matrix( sapply(unique(nations.ru.2018), function(x){sum(nations.ru.2018==x)}) ) 
) 
count.nations.ru.2019 <- cbind( 
  rep( "2019", length=length(unique(nations.ru.2019)) ), 
  unique(nations.ru.2019), 
  matrix( sapply(unique(nations.ru.2019), function(x){sum(nations.ru.2019==x)}) ) 
) 
count.nations.ru.2020 <- cbind( 
  rep( "2020", length=length(unique(nations.ru.2020)) ), 
  unique(nations.ru.2020), 
  matrix( sapply(unique(nations.ru.2020), function(x){sum(nations.ru.2020==x)}) ) 
) 
count.nations.ru.2021 <- cbind( 
  rep( "2021", length=length(unique(nations.ru.2021)) ), 
  unique(nations.ru.2021), 
  matrix( sapply(unique(nations.ru.2021), function(x){sum(nations.ru.2021==x)}) ) 
) 
count.nations.ru.2022 <- cbind( 
  rep( "2022", length=length(unique(nations.ru.2022)) ), 
  unique(nations.ru.2022), 
  matrix( sapply(unique(nations.ru.2022), function(x){sum(nations.ru.2022==x)}) ) 
) 

count.nations.ru <- data.frame(
  rbind(
    count.nations.ru.2017,
    count.nations.ru.2018,
    count.nations.ru.2019,
    count.nations.ru.2020,
    count.nations.ru.2021,
    count.nations.ru.2022
  )
)
colnames( count.nations.ru ) <- c("duration","Nation","count")

# other
count.nations.other.2017 <- cbind( 
  rep( "2017", length=length(unique(nations.other.2017)) ), 
  unique(nations.other.2017), 
  matrix( sapply(unique(nations.other.2017), function(x){sum(nations.other.2017==x)}) ) 
) 
count.nations.other.2018 <- cbind( 
  rep( "2018", length=length(unique(nations.other.2018)) ), 
  unique(nations.other.2018), 
  matrix( sapply(unique(nations.other.2018), function(x){sum(nations.other.2018==x)}) ) 
) 
count.nations.other.2019 <- cbind( 
  rep( "2019", length=length(unique(nations.other.2019)) ), 
  unique(nations.other.2019), 
  matrix( sapply(unique(nations.other.2019), function(x){sum(nations.other.2019==x)}) ) 
) 
count.nations.other.2020 <- cbind( 
  rep( "2020", length=length(unique(nations.other.2020)) ), 
  unique(nations.other.2020), 
  matrix( sapply(unique(nations.other.2020), function(x){sum(nations.other.2020==x)}) ) 
) 
count.nations.other.2021 <- cbind( 
  rep( "2021", length=length(unique(nations.other.2021)) ), 
  unique(nations.other.2021), 
  matrix( sapply(unique(nations.other.2021), function(x){sum(nations.other.2021==x)}) ) 
) 
count.nations.other.2022 <- cbind( 
  rep( "2022", length=length(unique(nations.other.2022)) ), 
  unique(nations.other.2022), 
  matrix( sapply(unique(nations.other.2022), function(x){sum(nations.other.2022==x)}) ) 
) 

count.nations.other <- data.frame(
  rbind(
    count.nations.other.2017,
    count.nations.other.2018,
    count.nations.other.2019,
    count.nations.other.2020,
    count.nations.other.2021,
    count.nations.other.2022
  )
)
colnames( count.nations.other ) <- c("duration","Nation","count")

# wtite ecxel sheets
count.nations.na[is.na(count.nations.na)] = 0
count.nations.sa[is.na(count.nations.sa)] = 0
count.nations.eu[is.na(count.nations.eu)] = 0
count.nations.af[is.na(count.nations.af)] = 0
count.nations.oc[is.na(count.nations.oc)] = 0
count.nations.mea[is.na(count.nations.mea)] = 0
count.nations.ea[is.na(count.nations.ea)] = 0
count.nations.ru[is.na(count.nations.ru)] = 0
count.nations.other[is.na(count.nations.other)] = 0

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

# write.xlsx( sheetList, paste("count.nations.na.year-", ".xlsx", sep=journal.dir) )
