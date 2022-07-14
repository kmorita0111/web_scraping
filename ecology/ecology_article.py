def auth_affil( webpage, article_no_title_web, article_type ):

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

    authors = driver.find_elements(By.CSS_SELECTOR, 'meta[name="citation_author"]')
    len_authors_list = len( authors )
    #print( len_authors_list )
    affils = driver.find_elements(By.CSS_SELECTOR, 'meta[name="citation_author_institution"]')
    len_affils_list = len( affils )

    #if len_authors_list == len_affils_list:
    #    print( "len_authors_list == len_authors_list" )
    # articles = elem.find_element( By.XPATH, ".." )

    # search for a corresponding author
    corr_type = driver.find_element(By.CSS_SELECTOR, 'p[class="author-type mb-1"]')
    corr_auth = corr_type.find_element( By.XPATH, ".." ).find_element(By.CSS_SELECTOR, 'p[class="author-name"]')
    corr_name = corr_auth.get_attribute("textContent")
    
    authors_info = []
    
    for i in range(0,len_authors_list):
        
        auth = authors[i].get_attribute("content")
        affi = affils[i].get_attribute("content")
        print( "        author " + str(i) + ": " + auth )
        print( "        affiliation " + str(i) + ": " + affi )

        # check correspondance
        corr = 0
        if auth in corr_name:
            corr = 1
            print( "Correspondance!" )
        
        author_info = []
        author_info.append( article_no_title_web[0] )
        author_info.append( article_no_title_web[1] )
        author_info.append( article_no_title_web[2] )
        author_info.append( auth ) # author name
        if i == 0: # status
            author_info.append( "first" )
        elif i == (len_authors_list-1):
            author_info.append( "last" )
        else:
            author_info.append( "middle" )
        if corr == 0: # correspondance
            author_info.append( 0 )
        elif corr > 0:
            author_info.append( 1 )
        author_info.append( affi ) # affiliation
        author_info.append( "none" ) # field
        author_info.append( article_type ) # article type

        authors_info.append( author_info )
        
    driver.quit()

    return( authors_info )
