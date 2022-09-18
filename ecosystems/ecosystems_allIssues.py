import csv
import pprint
import time
import random
import sys
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.chrome import service as fs
from selenium.webdriver.support.select import Select
from selenium.webdriver.support.relative_locator import locate_with

# Seleniumをあらゆる環境で起動させるChromeオプション                                                                  
option = Options()
option.add_argument('--disable-gpu')
option.add_argument('--disable-extensions')
option.add_argument('--proxy-server="direct://"')
option.add_argument('--proxy-bypass-list=*')
option.add_argument('--start-maximized')
option.add_experimental_option("excludeSwitches", ['enable-automation'])
#option.add_argument('--headless')

# ブラウザの起動
DRIVER_PATH = '/Users/morita/Documents/chromedriver'
chrome_servie = fs.Service(executable_path=DRIVER_PATH)
driver = webdriver.Chrome(service=chrome_servie, options=option)

# ファイルの呼び出し
import ecosystems_month

# Google chrome を開く
#url = sys.argv[1]
#driver.get( url )
driver.get('https://link.springer.com/journal/10021/volumes-and-issues')

parents = driver.find_elements(By.CSS_SELECTOR, 'li[class="app-section"]')
#elem = pare.find_elements(By.CSS_SELECTOR, 'li[class="card clearfix"]')
len_elem = len( parents )
print( "<---" + str(len_elem) + " volumes --->" )

# volumes
begin_year = 3
end_year = 6
for i in range(begin_year, end_year):

    # name & duration of volume
    volume_name = parents[i].find_element(By.CSS_SELECTOR, 'span[class="u-display-block u-flex-grow"]').text
    volume_duration = parents[i].find_element(By.CSS_SELECTOR, 'span[class="u-display-block u-flex-shrink u-text-sm u-text-sans-serif"]').text
    print( "<===== " + volume_name + " / " + volume_duration + " =====>" )
    # issues
    months = parents[i].find_elements(By.CSS_SELECTOR, 'li[class="c-list-group__item"]')
    len_month = len( months )

    # each issue
    for j in range(0,len_month):

        volume_list = []

        title = months[j].text
        print( str(j) + ": " + title + " =====>" )
        webpage = months[j].find_element(By.CSS_SELECTOR, '*').get_attribute("href")
        print( "    web page " + str(i) + ": " + webpage )
        
        volume_list.append([title,"title","web page","author","status","correspondance","affiliation","keyword","field","category"])

        # search for author information
        volume_list = ecosystems_month.search_articles( webpage, volume_list )

        # CSVファイルへ書き出す
        filename = "./result/" + volume_name.replace(' ','_') + "_" + title.replace(',','').replace(' ','_') + ".csv"
        with open( filename, 'w') as f:
            writer = csv.writer( f )
            len_row_list =  len( volume_list )
            print( "length of list = " + str( len_row_list ) )
            for k in range( 0, len_row_list ):
                writer.writerow( volume_list[k] )

# ブラウザを閉じる
driver.quit()
