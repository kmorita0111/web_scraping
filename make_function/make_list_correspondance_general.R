###--- setting working directory ---###
journal.dir <- "ecology"
wd.name <- paste( paste("~/web_scraping",journal.dir,sep="/"), "result2023_with_nation-1", sep="/" )
setwd( wd.name )

###--- csv list ---###
csv_list <- list.files( pattern = "*.csv" )
len.csv.list <- length( csv_list )

#install.packages("openxlsx")
library("openxlsx")

###--- all data ---###
data.all <- c()
for ( i in 1:len.csv.list ) {
  # file name
  filename <- c( filename, csv_list[i] )
  # length of data
  dat <- read.csv( csv_list[i] )
  temp <- cbind(rep( csv_list[i], length=length(dat[,1]) ), dat)
  colnames( temp ) <- c( "volume_issue", "id", "title", "web_page", "author", "status", 
                         "correspondance", "affiliation_1", "affiliation_2", "keyword", 
                         "field", "category", "nation_1", "area_1", "nation_2", "area_2" 
  )
  data.all <- rbind( data.all, temp )
}
vol.iss.all <- paste( data.all[,1], as.character(data.all[,2]), sep = "-" )

#!!!!!!!!!!!!!!!!!!!!!!#
###=== Input Area ===###
#!!!!!!!!!!!!!!!!!!!!!!#
area01 <- "North America"
area02 <- "Europe" # <<<=== option 1
area03 <- "Oceania" # <<<=== option 2

##########################################
###=== all non-corresponding author ===###
##########################################
num.non.crsp <- c( which( data.all$correspondance == 0 ),
                   which( data.all$area_1 == area01 )
                  )
num.non.crsp <- num.non.crsp[duplicated(num.non.crsp)]
# option 1
num.non.crsp01 <- c( which( data.all$correspondance == 0 ),
                   which( data.all$area_1 == area02 )
                  )
num.non.crsp01 <- num.non.crsp01[duplicated(num.non.crsp01)]
# option 2
num.non.crsp02 <- c( which( data.all$correspondance == 0 ),
                   which( data.all$area_1 == area03 )
                  )
num.non.crsp02 <- num.non.crsp02[duplicated(num.non.crsp02)]
# sorting
num.non.crsp <- sort( c( num.non.crsp, num.non.crsp01, num.non.crsp02 ) )

# all authors about the focal area
temp <- vol.iss.all[num.non.crsp]
vol.iss <- temp[!duplicated(temp)]
data.area <- c()
for ( i in 1:length(vol.iss) ) {
  
  num <- length( which(vol.iss.all==vol.iss[i]) )
  data.part <- data.all[which(vol.iss.all==vol.iss[i]),]
  if( ncol( data.part ) == 1 ){
    data.part <- t( data.part )
  }
  data.area <- rbind( data.area, data.part ) # 注目する地域出身のnon-corresponding authorを含む論文の全著者
  
}
#View( data.area )

##-- Corresponding author list about the focal area --##
num.crsp.all <- which( data.area$correspondance == 1 )
data.area.crsp.all <- data.area[num.crsp.all,] # data.areaにおけるcorresponding author

##-- Corresponding author is from the focal area --##
num.crsp.same.area <- c( which( data.area$correspondance == 1 ),
                         which( data.area$area_1 == area01 )
                        )
num.crsp.same.area <- num.crsp.same.area[duplicated(num.crsp.same.area)]
# option 1
num.crsp.same.area01 <- c( which( data.area$correspondance == 1 ),
                           which( data.area$area_1 == area02 )
                          )
num.crsp.same.area01 <- num.crsp.same.area01[duplicated(num.crsp.same.area01)]
# option 2
num.crsp.same.area02 <- c( which( data.area$correspondance == 1 ),
                           which( data.area$area_1 == area03 )
                          )
num.crsp.same.area02 <- num.crsp.same.area02[duplicated(num.crsp.same.area02)]

# sorting
num.crsp.same.area <- sort( c( num.crsp.same.area, num.crsp.same.area01, num.crsp.same.area02 ) )

##-- corresponding author --##
#View(data.area[num.crsp.same.area,])
num.crsp.all # data.area の corresponding author の行番号
num.crsp.same.area # data.area の 注目している地域出身の corresponding author の行番号
num.crsp.not.same.area <- num.crsp.all # data.area の 注目している地域以外が出身の corresponding author の行番号
for ( n in num.crsp.same.area ) {
  num.crsp.not.same.area <- num.crsp.not.same.area[-which(num.crsp.not.same.area==n)]
}

# 注目している地域以外が出身の corresponding author を含む論文の全著者リスト
data.area.non.crsp <- c()
#View(data.area[num.crsp.not.same.area,])
vol.iss.crsp.not.area <- paste( data.area[num.crsp.not.same.area,1], as.character(data.area[num.crsp.not.same.area,2]), sep = "-" )

for ( i in 1:length(vol.iss.crsp.not.area) ) {
  
  num <- length( which(vol.iss.all==vol.iss.crsp.not.area[i]) )
  data.part <- data.all[which(vol.iss.all==vol.iss.crsp.not.area[i]),]
  if( ncol( data.part ) == 1 ){
    data.part <- t( data.part )
  }
  data.area.non.crsp <- rbind( data.area.non.crsp, data.part )
  
}

# 注目している地域出身の corresponding author を含む論文の全著者リスト
data.area.crsp <- c()
# 注目している地域出身の corresponding author かつ全てのnon-corresponding authorと国籍が一致している論文の全著者リスト
data.area.crsp.native <- c()
# 注目している地域出身の corresponding author かつnon-corresponding authorの1人でも国籍が一致していない論文の全著者リスト
data.area.crsp.non.native <- c()

#View(data.area[num.crsp.same.area,])
vol.iss.crsp.area <- paste( data.area[num.crsp.same.area,1], as.character(data.area[num.crsp.same.area,2]), sep = "-" )

for ( i in 1:length(vol.iss.crsp.area) ) {
  
  # 注目している地域出身の corresponding author を含む1つの論文の著者番号
  num <- length( which(vol.iss.all==vol.iss.crsp.area[i]) )
  data.part <- data.all[which(vol.iss.all==vol.iss.crsp.area[i]),]
  if( ncol( data.part ) == 1 ){
    data.part <- t( data.part )
  }
  data.area.crsp <- rbind( data.area.crsp, data.part )
  
  
  # 注目している地域出身の corresponding author とそれ以外の国籍の比較
  if( nrow(data.part) == 1 ){
    
    data.area.crsp.native <- rbind( data.area.crsp.native, data.part )
    
  } else if( nrow(data.part) == 2 ){
    
    num.nation.crsp <- which(data.part$correspondance == 1)
    num.nation.non.crsp <- which(data.part$correspondance == 0)
    
    nation.crsp <- data.part[num.nation.crsp,]$nation_1
    nation.non.crsp <- data.part[num.nation.non.crsp,]$nation_1
    
    if( nation.crsp !=  nation.non.crsp ){
      data.area.crsp.non.native <- rbind( data.area.crsp.non.native, data.part )
    } else {
      data.area.crsp.native <- rbind( data.area.crsp.native, data.part )
    }
    
  } else if( nrow(data.part) > 2 ){
    
    data.part.part <- data.part[which( data.part$area_1 == area01 ),]
    data.part.part01 <- data.part[which( data.part$area_1 == area02 ),] # <<<=== option 1
    data.part.part02 <- data.part[which( data.part$area_1 == area03 ),] # <<<=== option 2
    data.part.part <- rbind( data.part.part, data.part.part01, data.part.part02 )
    
    num.nation.crsp <- which(data.part.part$correspondance == 1)
    num.nation.non.crsp <- which(data.part.part$correspondance == 0)
    
    nation.crsp <- data.part.part[num.nation.crsp,]$nation_1
    nation.non.crsp <- data.part.part[num.nation.non.crsp,]$nation_1
    
    cnt <- 0
    for ( nat in nation.crsp ) {
      len <- length( which( nation.non.crsp == nat ) )
      if( len != length(nation.non.crsp) ){ cnt <- cnt + 1 }
    }
    if( cnt > 0 ){
      data.area.crsp.non.native <- rbind( data.area.crsp.non.native, data.part )
      #print( "len: " ) ; print( len )
      #print( "length(nation.non.crsp): " ) ; print( length(nation.non.crsp) )
      #print( "<--- nation.crsp --->" ) ; print( nation.crsp )
      #print( "=== nation.non.crsp ===" ); print( nation.non.crsp )
    } else {
      data.area.crsp.native <- rbind( data.area.crsp.native, data.part )
    }
    
  }
  
}


#########################################################
###=== corresponding author is from the focal area ===###
#########################################################
num.crsp <- c( which( data.all$correspondance == 1 ),
               which( data.all$area_1 == area01 )
              )
num.crsp <- num.crsp[duplicated(num.crsp)]
# <<<=== option 1
num.crsp01 <- c( which( data.all$correspondance == 1 ),
                 which( data.all$area_1 == area02 )
              )
num.crsp01 <- num.crsp01[duplicated(num.crsp01)]
# <<<=== option 2
num.crsp02 <- c( which( data.all$correspondance == 1 ),
                 which( data.all$area_1 == area03 )
              )
num.crsp02 <- num.crsp02[duplicated(num.crsp02)]

# sorting
num.crsp <- sort( c( num.crsp, num.crsp01, num.crsp02 ) )
#View(data.all[num.crsp,])
data.area.crsp.all <- data.all[num.crsp,]
vol.iss.crsp <- paste( data.area.crsp.all[,1], as.character(data.area.crsp.all[,2]), sep = "-" )

# 注目している地域出身の corresponding author を含む論文の全著者リスト
data.area.crsp.all.all <- c()
# 注目している地域出身の corresponding author の国籍がとそれ以外の全著者の国籍と違う場合
data.area.crsp.all.non.native <- c()
# 注目している地域出身の author の単著
data.area.crsp.single <- c()

for ( i in 1:length(vol.iss.crsp) ) {
  
  # 注目している地域出身の corresponding author を含む1つの論文の著者番号
  num <- length( which(vol.iss.all==vol.iss.crsp[i]) )
  data.part <- data.all[which(vol.iss.all==vol.iss.crsp[i]),]
  if( ncol( data.part ) == 1 ){
    data.part <- t( data.part )
  }
  data.area.crsp.all.all <- rbind( data.area.crsp.all.all, data.part )
  
  # 注目している地域出身の corresponding author とそれ以外の国籍の比較
  if( nrow(data.part) == 1 ){ 
    
    data.area.crsp.single <- rbind( data.area.crsp.single, data.part )
  
  } else if( nrow(data.part) > 1 ){
    
    #num.nation.crsp <- which(data.part$correspondance == 1)
    num.nation.non.crsp <- which(data.part$correspondance == 0)
    
    #area.crsp <- data.part[num.nation.crsp,]$area_1
    area.non.crsp <- data.part[num.nation.non.crsp,]$area_1
    
    len <- length( which( area.non.crsp == area01 ) )
    len <- len + length( which( area.non.crsp == area02 ) ) # <<<=== option 1
    len <- len + length( which( area.non.crsp == area03 ) ) # <<<=== option 2
    
    if( len < 1 ){
      data.area.crsp.all.non.native <- rbind( data.area.crsp.all.non.native, data.part )
    }
  }
  
}

##############
# 論文リスト #
##############
###=== 注目している地域出身の non-corresponding author を含む場合 ===###
# 注目する地域出身のnon-corresponding authorを含む論文の全著者リスト
data.area
# data.areaの中で、注目している地域以外が出身の corresponding author を含む論文の全著者リスト
data.area.non.crsp
# data.areaの中で、注目している地域出身の corresponding author を含む論文の全著者リスト
#data.area.crsp
# 注目している地域出身の corresponding author、かつ同じ地域出身のnon-corresponding authorの国籍が1人でも一致していない論文の全著者リスト
data.area.crsp.non.native
# 注目している地域出身の corresponding author、かつ全てのnon-corresponding authorと国籍が一致している論文の全著者リスト
data.area.crsp.native
###=== 注目している地域出身の corresponding author を含む場合 ===###
# 注目している地域出身の corresponding author を含む論文の全著者リスト
data.area.crsp.all.all
# 注目している地域出身の corresponding author の国籍がとそれ以外の全著者の国籍と違う場合
data.area.crsp.all.non.native
# 注目している地域出身の author の単著
data.area.crsp.single


########
# 集計 #
########
print( paste( "<<< Non-corresponding author >>>", area01, sep = "===>>> " ) )
print( "--- ( Non-corresponding author ) ---" )
temp <- paste( data.area[,1], as.character(data.area[,2]), sep = "-" )
temp <- temp[!duplicated(temp)]
print( paste("the number of papers including non-corresponding author from Western:", as.character( length(temp) ) )  )
temp <- paste( data.area.non.crsp[,1], as.character(data.area.non.crsp[,2]), sep = "-" )
temp <- temp[!duplicated(temp)]
print( paste("The other (Correspo) vs western (Non-correspo):", as.character( length(temp) ) )  )
temp <- paste( data.area.crsp.non.native[,1], as.character(data.area.crsp.non.native[,2]), sep = "-" )
temp <- temp[!duplicated(temp)]
print( paste("Non-native (Correspo) vs Native (Non-correspo):", as.character( length(temp) ) )  )
temp <- paste( data.area.crsp.native[,1], as.character(data.area.crsp.native[,2]), sep = "-" )
temp <- temp[!duplicated(temp)]
print( paste("Native (Correspo) vs Native (Non-correspo):", as.character( length(temp) ) )  )

print( "--- ( Corresponding author ) ---" )
temp <- paste( data.area.crsp.all.all[,1], as.character(data.area.crsp.all.all[,2]), sep = "-" )
temp <- temp[!duplicated(temp)]
print( paste("the number of papers including corresponding author from Western:", as.character( length(temp) ) ) )
temp <- paste( data.area.crsp.all.non.native[,1], as.character(data.area.crsp.all.non.native[,2]), sep = "-" )
temp <- temp[!duplicated(temp)]
print( paste( "Western (Correspo) vs the others are Western (Non-correspo): ", as.character( length(temp) ) ) )
print( paste( "Western (Correspo) single author : ", as.character( length(data.area.crsp.single[,1]) ) ) )
