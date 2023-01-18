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

    elem = driver.find_element(By.CSS_SELECTOR, 'h3[id="heading-level-1-2"]')
    article_type = ""
    for i in range(1,20):
        idName = "heading-level-1-" + str(i)
        tag_id = 'h3[id="' + idName + '"]'
        #try:
        elem = driver.find_element( By.CSS_SELECTOR, tag_id )
        if ( "ARTICLES" in elem.get_attribute("title") ) or ( "Articles" in elem.get_attribute("title") ) or ( "ARTICLE" in elem.get_attribute("title") ) or ( "Article" in elem.get_attribute("title") ):
            print( elem.get_attribute("title") )
            article_type = "Article"
            
            articles = elem.find_element( By.XPATH, ".." )
            article = articles.find_elements(By.CSS_SELECTOR, 'div[class="issue-item"]')
            len_article = len( article )
            print( str(len_article) + " articles!")
            # ファイルの呼び出し
            import citing_ecology_article
            
            for j in range(0,len_article):
                # title
                aTitle = article[j].find_element(By.CSS_SELECTOR, 'a[class="issue-item__title visitable"]').text
                print( "    " + str(j) + ": " + aTitle )
                
                # web address
                aWebs = article[j].find_element(By.CSS_SELECTOR, 'div[class="content-item-format-links"]').find_element(By.CSS_SELECTOR, 'ul[class="rlist--inline separator issue-item__links"]')
                aWeb_abst = aWebs.find_element(By.CSS_SELECTOR, 'a[title="Abstract"]')
                aWeb = aWeb_abst.get_attribute("href")
                print( "        web page " + str(j) + ": " + aWeb )
                
                # No., title, & web page address of each article
                #article_no_title_web = [i, aTitle, aWeb]
                
                # search for citing information
                citing_info = []
                citing_info = citing_ecology_article.auth_affil( aWeb, j )
                # add article information to the origical list
                len_citing_info = len( citing_info )
                for k in range( 0, len_citing_info ):
                    volume_list.append( citing_info[k] )
                    
        #except NoSuchElementException:
        #    print("No more articles")
        #    break
                    
    # ブラウザを閉じる
    driver.quit()

    return( volume_list )
