import pandas as pd

# Area list
#north_america = ["USA","Canada"]
#europe = ["Germany","United kingdom","France","Sweden"]
#Asia = ["China","Japan","Shingapore"]

journal = 'ecology'
title = 'Volume_103_Issue_7'
originalFilename = '~/web_scraping/' + journal + '/result/' + title + '.csv'
df = pd.read_csv( originalFilename, index_col=0)
#print( df )
print( 'search nation in ' + title + ' in ' + journal  )

# recorder
nations = []

# search nation
for affil in df['affiliation']:

    ind = affil.rfind(' ')
    nation = affil[ind:len( affil )]
    nations.append( nation )
    # print( nation )

df["nation"] = nations 

# CSVファイルへ書き出す                                                                                            
newFilename = '~/web_scraping/' + journal + '/result/' + title + '-1.csv'
df.to_csv( newFilename )

print( 'finised!'  )
