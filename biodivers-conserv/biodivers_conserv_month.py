def search_articles( monWeb, volume_list ): 

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
    from selenium.common.exceptions import NoSuchElementException
    #from fake_useragent import UserAgent # fake user
    
    # Seleniumをあらゆる環境で起動させるChromeオプション
    option = Options()
    option.add_argument('--disable-gpu')
    option.add_argument('--disable-extensions')
    option.add_argument('--proxy-server="direct://"')
    option.add_argument('--proxy-bypass-list=*')
    option.add_argument('--start-maximized')
    option.add_experimental_option("excludeSwitches", ['enable-automation'])
    #option.add_argument('--headless')
    option.add_argument("--enable-javascript")
    #option.add_argument('--window-size=1920,1080')    

    # ブラウザの起動
    DRIVER_PATH = '/Users/morita/Documents/chromedriver'
    chrome_servie = fs.Service(executable_path=DRIVER_PATH)
    driver = webdriver.Chrome(service=chrome_servie, options=option)
    #driver.set_window_size('1200', '1000')

    # Googleを開く
    #url = sys.argv[1]
    #driver.get( url )
    driver.get( monWeb )

    articles = driver.find_elements(By.CSS_SELECTOR, 'article[class="c-card c-card--flush u-flex-direction-row"]')
    len_arti = len( articles )
    article_type = ""
    
    for i in range( 0, len_arti ):

        article = articles[i].find_element(By.CSS_SELECTOR, 'h3[class="c-card__title"]')
        
        aTitle = article.text
        print( "    " + str(i) + ": " + aTitle )
        aWeb = article.find_element(By.CSS_SELECTOR, 'a[href]').get_attribute("href")
        print( "        web page " + str(i) + ": " + aWeb )
        
        # No., title, & web page address of each article
        article_no_title_web = [i, aTitle, aWeb]

        #try:
            #article.find_element(By.CSS_SELECTOR, 'ul[class="c-author-list c-author-list--compact c-author-list--truncated u-text-sm"]')
            
            # ファイルの呼び出し
        import biodivers_conserv_article
        # search & append authors' name, status, correspondance, affiliation, field, category of each article
        authors_info = []
        authors_info = biodivers_conserv_article.auth_affil( aWeb, article_no_title_web, article_type )
        
        # add article information to the origical list
        len_author_info = len( authors_info )
        #print( "length of author information = " + str( len_author_info ) )
        for j in range(0,len_author_info):
            volume_list.append( authors_info[j] )
            
        #except NoSuchElementException:
        #    print("exception handled")
            
    # ブラウザを閉じる
    driver.quit()
    #print( volume_list )
    #sys.exit(1)
    return( volume_list )
