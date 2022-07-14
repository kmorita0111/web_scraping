def search_articles( monWeb ): 

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
    driver.get( monWeb )
    
    elem = driver.find_element(By.CSS_SELECTOR, 'h3[id="heading-level-1-4"]')
    articles = elem.find_element( By.XPATH, ".." )
    
    article = articles.find_elements(By.CSS_SELECTOR, 'a[class="issue-item__title visitable"]')
    len_article = len( article )
    authors = articles.find_elements(By.CSS_SELECTOR, 'div[class="loa comma loa-authors-trunc"]')
    len_authors_list = len( authors )
    #print( len_article )

    # ファイルの呼び出し
    import ecology_article

    for i in range(0,len_article):
        aTitle = article[i].text
        print( "    " + str(i) + ": " + aTitle )
        aWeb = article[i].get_attribute("href")
        print( "        web page " + str(i) + ": " + aWeb )
        
        ecology_article.auth_affil( aWeb )
        ###=====================###
        # driver.get( aWeb )
        ###=== more to write ===###
        # driver.quit()
        ###=====================###
        #author_list = authors[i].find_elements(By.CSS_SELECTOR, 'span[class="author-style"]')
        #author_num = len( author_list )
        #for j in range(0,author_num):
        #    print( "    " + str(j) + ": " + author_list[j].text )


    #with open('sample.csv', 'w') as f:
    #    writer = csv.writer(f)
    #    writer.writerow( [title_name, html_name, result.strip('"')] )
        
        
    # ブラウザを閉じる
    driver.quit()
