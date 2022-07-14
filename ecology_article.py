def auth_affil( webpage ):

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
    option.add_argument('--disable-gpu');
    option.add_argument('--disable-extensions');
    option.add_argument('--proxy-server="direct://"');
    option.add_argument('--proxy-bypass-list=*');
    option.add_argument('--start-maximized');
    option.add_experimental_option("excludeSwitches", ['enable-automation'])
    #option.add_argument('--headless')

    # ブラウザの起動
    DRIVER_PATH = '/Users/morita/Documents/chromedriver'
    chrome_servie = fs.Service(executable_path=DRIVER_PATH)
    driver = webdriver.Chrome(service=chrome_servie, options=option)
    
    # Googleを開く
    #url = sys.argv[1]
    #driver.get( url )
    driver.get( webpage )

    authors = driver.find_elements(By.CSS_SELECTOR, 'meta[name="citation_author"]')
    len_authors_list = len( authors )
    #print( len_authors_list )
    affils = driver.find_elements(By.CSS_SELECTOR, 'meta[name="citation_author_institution"]')
    len_affils_list = len( affils )

    #if len_authors_list == len_affils_list:
    #    print( "len_authors_list == len_authors_list" )
    # articles = elem.find_element( By.XPATH, ".." )
    
    for i in range(0,len_authors_list):
        auth = authors[i].get_attribute("content")
        affi = affils[i].get_attribute("content")
        print( "        author " + str(i) + ": " + auth )
        print( "        affiliation " + str(i) + ": " + affi )
        
        
    #with open('sample.csv', 'w') as f:
    #    writer = csv.writer(f)
    #    writer.writerow( [title_name, html_name, result.strip('"')] )    
    # ブラウザを閉じる
    driver.quit()
