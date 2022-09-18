def auth_affil( webpage, article_no_title_web, article_type ):

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
    driver.get( webpage )

    # the number of authors
    authors = []
    try:
        authors = driver.find_element(By.CSS_SELECTOR, 'ul[class="c-article-author-list c-article-author-list--short js-no-scroll"]').find_elements(By.CSS_SELECTOR, 'li')
    except NoSuchElementException:
        print("exception handled")
        authors = driver.find_element(By.CSS_SELECTOR, 'ul[class="c-article-author-list c-article-author-list--long js-no-scroll"]').find_elements(By.CSS_SELECTOR, 'li')
    len_list = len( authors )
    
    # search for a corresponding author
    corr_name = ""
    try:
        corr_type = driver.find_element(By.CSS_SELECTOR, 'a[id="corresp-c1"]')
        corr_name = corr_type.text
    except NoSuchElementException:
        print("exception handled")
        
    # search for keywords         
    keywords = []
    elem_keywords = driver.find_elements(By.CSS_SELECTOR, 'li[class="c-article-subject-list__subject"]')
    len_elem_keywords = len( elem_keywords )
    for i in range(0,len_elem_keywords):
        kw = elem_keywords[i].find_element(By.CSS_SELECTOR, 'span').text
        print( kw )
        keywords.append( kw )
    #sys.exit(1)

    # search for author information
    authors_info = []

    try:
        # search for affiliation
        affiliation_list = driver.find_element(By.CSS_SELECTOR, 'ol[class="c-article-author-affiliation__list"]').find_elements(By.CSS_SELECTOR, 'li[id]')
        len_affi_list = len( affiliation_list )
        #print( len_list )
    
        for i in range(0,len_list):
            try:
                # author's name
                #wait = WebDriverWait(driver, 10)
                #wait.until( EC.visibility_of_element_located( (By.CSS_SELECTOR, 'a') ) )
                auth = authors[i].find_element(By.CSS_SELECTOR, 'a').text
                print( "        author " + str(i) + ": " + auth )
                # check correspondance                                                                                        
                corr = 0
                if auth in corr_name:
                    corr = 1
                    print( "        --> Correspondance!" )
                    
                # check affiliation
                affi = ""
                for j in range(0,len_affi_list):
                    affi_auth = affiliation_list[j].find_element(By.CSS_SELECTOR, 'p[class="c-article-author-affiliation__authors-list"]').text
                    if auth in affi_auth:
                        affi = affiliation_list[j].find_element(By.CSS_SELECTOR, 'p[class="c-article-author-affiliation__address"]').text
                        break
                print( "        affiliation " + str(i) + ": " + affi )
            
                author_info = []
                author_info.append( article_no_title_web[0] )
                author_info.append( article_no_title_web[1] )
                author_info.append( article_no_title_web[2] )
                author_info.append( auth ) # author name
                
                # status
                if i == 0:
                    author_info.append( "first" )
                elif i == (len_list-1):
                    author_info.append( "last" )
                else:
                    author_info.append( "middle" )
                    
                # correspondance
                if corr == 0: 
                    author_info.append( 0 )
                elif corr > 0:
                    author_info.append( 1 )
                    
                # affiliation
                author_info.append( affi )
                # keyword
                author_info.append( "/".join( keywords ) )
                # field
                author_info.append( "none" )
                # article type
                author_info.append( article_type )
                # add author_info to authors_info
                authors_info.append( author_info )
                
            except NoSuchElementException:
                print("exception handled")
        
    except NoSuchElementException:
        print("exception handled")

    #sys.exit(1)
    driver.quit()
    return( authors_info )
