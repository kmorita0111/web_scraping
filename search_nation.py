import pandas as pd

# Area list
north_america = ["USA","Canada"]
south_america = ["Panama","Argentina","Brazil"]
europe = ["Austria","Hungary","Italy","Finland","Denmark","Germany","United kingdom","UK","France","Sweden","Spain","Belgium","Portugal","Netherlands","Republic"]
africa = ["Kenya","Africa","Uganda"]
oceania = ["Australia","Zealand","Guinea"]
asia = ["China","Japan","Singapore"]

journal = 'ecology'
title = 'Volume_103_Issue_2'
originalFilename = '~/web_scraping/' + journal + '/result/' + title + '.csv'
df = pd.read_csv( originalFilename, index_col=0)
#print( df )
print( 'search nation in ' + title + ' in ' + journal  )

# recorder
nations = []
areas = []

for affil in df['affiliation']:
    # search nation
    ind = affil.rfind(' ')
    nation = affil[(ind+1):len( affil )]
    nations.append( nation )
    # print( nation )

    # search area
    if nation in north_america:
        areas.append( "North America" )
    elif nation in south_america:
        areas.append( "South America" )
    elif nation in europe:
        areas.append( "Europe" )
    elif nation in africa:
        areas.append( "Africa" )
    elif nation in oceania:
        areas.append( "Oceania" )
    elif nation in asia:
        areas.append( "Asia" )
    else:
        areas.append( "Others" )

# adding nation & area        
df["nation"] = nations 
df["area"] = areas

# CSVファイルへ書き出す                                                                                            
newFilename = '~/web_scraping/' + journal + '/result/' + title + '-1.csv'
df.to_csv( newFilename )

print( 'finised!'  )
