import glob
import pandas as pd

#--- Area list ---#
north_america = ["America","USA","United States","Michigan","Hawaii","Wisconsin","Washington","Maryland","Tennessee","Massachusetts","Connecticut","North Carolina","California","Colorado","Idaho","Wyoming","New Jersey","Oregon","Alaska","New York","Florida","Virginia","Texas","Alabama","Georgia","Utah","Maine","Illinois","Pennsylvania","San Francisco","Arizona","Montana","Louisiana","Minnesota","Arkansas","Missouri","Kentucky","Oklahoma","Ohio","Nevada","Kansas","Iowa","Nebraska","Harvard","Delaware","Mississippi","San Diego","Houston","Austin","Chicago","Princeton","New Orleans","South Dakota","North Dakota","Washington","Vermont","South Carolina","Canada","Syracuse","Greenland"]
south_america = ["Panama","Argentina","Brazil","Brasil","Chile","Puerto Rico","México","Mexico","Panama","Panamá","Ecuador","Peru","Perú","Bermuda","Colombia","Ghana","Bolivia","Paraguay","Costa Rica","Ethiopia","Trinidad and Tobago","Palau","Barbados","Venezuela","Uruguay"]
europe = ["Austria","Hungary","Italy","Finland","Denmark","Germany","United Kingdom","UK","U.K.","England","Edinburgh","Hampshire","Cambridge","France","Sweden","Spain","Belgium","Portugal","Netherlands","Czech Republic", "Iceland", "Poland", "Norway","Finland","Switzerland","Estonia","Greece","Serbia","Ireland","Slovenia","Slovak Republic","EBCC","Fife","Scotland","Curaçao","Czechia","Montpellier","Island","Romania"]
africa = ["Kenya","South Africa","Uganda","Egypt","Ghana","Congo","Guiana","Cameroon","Uganda","Gabon","Zimbabwe","Tanzania","Burkina Faso","Mozambique","Namibia","Benin Republic","El Salvador","São Tomé and Príncipe","Botswana","Senegal","Algeria","Zambia","Cabo Verde","Alexandria"]
oceania = ["Australia","Queensland","New Zealand","Guinea","Papua New Guinea","Madagascar","New Caledonia","Tonga","Polynesia"]
middle_east_asia = ["Israel","Saudi Arabia","Turkey","Kazakhstan","Iran"]
asia = ["China","Japan","Singapore","Thailand","India","Taiwan","Indonesia","Malaysia","Croatia","Korea","Hong Kong","Mongolia","Cambodia","Philippines","Nepal","Brunei Darussalam"]
russia = ["Russia"]
allnations = south_america + europe + africa + oceania + middle_east_asia + asia + russia + north_america

#--- determining csv ---#
journal = 'evolution'
files = glob.glob( "./" + journal + "/result/*.csv" )
for file in files:

    fbegin = file.find("Volume")
    fend = file.find(".csv")
    title = file[fbegin:fend]
    print( title )
    df = pd.read_csv( file, index_col=0)

    #--- recorder ---#
    nations = []
    areas = []
    
    for affil in df['affiliation']:
        #--- search nation ---#
        print( affil )

        nation = "USA or others"
        for list_nation in allnations:
            #print( list_nation )
            if list_nation in affil:
                nation = list_nation 
                break
        nations.append( nation )
        print( "!" + nation )
        
        #--- search area ---#
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
        elif nation in middle_east_asia:
            areas.append( "Middle East Asia" )
        elif nation in asia:
            areas.append( "East Asia" )
        elif nation in russia:
            areas.append( "Russia" )
        else:
            areas.append( "Others" )
            
    #--- adding nation & area ---#
    df["nation"] = nations 
    df["area"] = areas
            
    #--- CSVファイルへ書き出す ---#
    newFilename = '~/web_scraping/' + journal + '/result_with_nation/' + title + '-1.csv'
    df.to_csv( newFilename )
        
print( 'finised!'  )
            
