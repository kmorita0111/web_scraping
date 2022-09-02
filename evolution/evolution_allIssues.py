import csv
import pprint
import time
import random
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
import evolution_month

# Google chrome を開く
#url = sys.argv[1]
#driver.get( url )
driver.get('https://onlinelibrary.wiley.com/loi/15585646/year/2017')

pare = driver.find_element(By.CSS_SELECTOR, 'ul[class="rlist loi__issues"]')
elem = pare.find_elements(By.CSS_SELECTOR, 'li[class="card clearfix"]')
len_elem = len( elem )
print( len_elem )

for i in range(0,len_elem):

    volume_list = []
    month = elem[i].find_element(By.CSS_SELECTOR, 'h4[class="parent-item"]')
    title = month.text
    print( str(i) + ": " + title )
    #webpage = month.get_attribute("href")
    webpage = month.find_element(By.CSS_SELECTOR, '*').get_attribute("href")
    print( "    web page " + str(i) + ": " + webpage )

    volume_list.append([title,"title","web page","author","status","correspondance","affiliation","keyword","field","category"])

    # search for author information
    volume_list = evolution_month.search_articles( webpage, volume_list )

    # CSVファイルへ書き出す
    filename = "./result/" + title.replace(',','').replace(' ','_') + ".csv"
    with open( filename, 'w') as f:
        writer = csv.writer( f )
        len_row_list =  len( volume_list )
        for j in range( 0, len_row_list ):
            writer.writerow( volume_list[j] )

# ブラウザを閉じる
driver.quit()
