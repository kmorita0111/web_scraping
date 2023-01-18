#========================================
#
# Modification of spelling inconsistency 
#
#========================================

journal.dir <- "ecology"
wd.name <- paste( paste("~/web_scraping",journal.dir,sep="/"), "result2023_with_nation", sep="/" )
setwd( wd.name )
save.wd.name <- paste( paste("~/web_scraping",journal.dir,sep="/"), "result2023_with_nation-1", sep="/" )

###--- csv list ---###
csv_list <- list.files( pattern = "*.csv" )
len.csv.list <- length( csv_list )

filename <- c()
for ( i in 1:len.csv.list ) {
  # file name
  filename <- c( filename, csv_list[i] )
  print( substr( csv_list[i], 1, nchar(csv_list[i])-6 ) )
  # length of data
  dat <- read.csv( csv_list[i] )

  ###=== USA ===###
  ###--- affiliation 1 ---###
  dat$nation_1[which( dat$nation_1 == "America" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "United States" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Michigan" )] <- "USA"

  ###--- affiliation 2 ---###
  dat$nation_2[which( dat$nation_2 == "America" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Michigan" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Hawaii" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Hawai'i" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Wisconsin" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Washington" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Maryland" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Tennessee" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Massachusetts" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Connecticut" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "North Carolina" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "California" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Colorado" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Idaho" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Wyoming" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "New Jersey" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Oregon" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Alaska" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "New York" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Florida" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Virginia" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Texas" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Alabama" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Georgia" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Utah" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Maine" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Illinois" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Pennsylvania" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "San Francisco" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Arizona" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Montana" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Louisiana" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Minnesota" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Arkansas" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Missouri" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Kentucky" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Oklahoma" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Ohio" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Nevada" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Kansas" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Iowa" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Nebraska" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Harvard" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Delaware" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Mississippi" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "San Diego" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Houston" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Austin" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Chicago" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Princeton" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "New Orleans" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "South Dakota" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "North Dakota" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Washington" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Vermont" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "South Carolina" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Syracuse" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Cottonwood St. Woodland" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Middlebury" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Arizona" )] <- "USA"
  dat$nation_1[which( dat$nation_1 == "Stanford" )] <- "USA"
  
  ###=== UK ===###
  dat$nation_1[which( dat$nation_1 == "United Kingdom" )] <- "UK"
  dat$nation_1[which( dat$nation_1 == "U.K." )] <- "UK"
  dat$nation_1[which( dat$nation_1 == "England" )] <- "UK"
  dat$nation_1[which( dat$nation_1 == "Edinburgh" )] <- "UK"
  dat$nation_1[which( dat$nation_1 == "Hampshire" )] <- "UK"
  dat$nation_1[which( dat$nation_1 == "Cambridge" )] <- "UK"
  dat$nation_1[which( dat$nation_1 == "Scotland" )] <- "UK"
  dat$nation_1[which( dat$nation_1 == "Fife" )] <- "UK"
  
  dat$nation_1[which( dat$nation_1 == "Montpellier" )] <- "France"
  
  dat$nation_1[which( dat$nation_1 == "Curaçao" )] <- "Netherlands"
  dat$nation_1[which( dat$nation_1 == "EBCC" )] <- "Netherlands"
  
  dat$nation_1[which( dat$nation_1 == "Czechia" )] <- "Czech Republic"
  
  dat$nation_1[which( dat$nation_1 == "Island" )] <- "Iceland"
  
  ###=== Brazil ===###
  dat$nation_1[which( dat$nation_1 == "Brasil" )] <- "Brazil"
  dat$nation_1[which( dat$nation_1 == "México" )] <- "Mexico"
  dat$nation_1[which( dat$nation_1 == "Perú" )] <- "Peru"
  dat$nation_1[which( dat$nation_1 == "Panamá" )] <- "Panama"
  
  ###=== Australia ===###
  dat$nation_1[which( dat$nation_1 == "Queensland" )] <- "Australia"
  dat$nation_1[which( dat$nation_1 == "New South Wales" )] <- "Australia"

  ###=== Egypt ===###
  dat$nation_1[which( dat$nation_1 == "Alexandria" )] <- "Egypt"
  dat$nation_1[which( dat$nation_1 == "Parc W-Niger" )] <- "Niger"
  
  ###=== China ===###
  dat$nation_1[which( dat$nation_1 == "Hong Kong" )] <- "China"
  
  ###=== export ===###
  write.csv(dat, file = paste( save.wd.name, paste( substr( csv_list[i], 1, nchar(csv_list[i])-6 ), "csv", sep = "-2." ), sep = "/" ), row.names = FALSE )
}