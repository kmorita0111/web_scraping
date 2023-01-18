def auth_affil( webpage, ind_arti ):

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

    # showing citing reference by clicking
    elem = driver.find_element(By.CSS_SELECTOR, 'div[aria-controls="cited-by__content"]')
    driver.execute_script('arguments[0].click();', elem)
    
    #try:
    # search for author information         
    authors_info = []


    citing_ref = driver.find_element(By.CSS_SELECTOR, 'ul[class="rlist cited-by__list"]')
    WebDriverWait(citing_ref, 60).until(EC.presence_of_element_located( (By.CSS_SELECTOR, 'li[class="citedByEntry"]') ) )
    #driver.implicitly_wait(10)
    citing_list = citing_ref.find_elements(By.CSS_SELECTOR, 'li[class="citedByEntry"]')
    len_citing_list = len( citing_list )
    print( "        --> " + str(len_citing_list) + " citation" )
    
    for i in range( 0, len_citing_list ):
        
        author_info = []
        # index of articles
        author_info.append( ind_arti )
        # index of citing references
        author_info.append( i )
        
        citing_inform = citing_list[i].find_elements(By.CSS_SELECTOR, 'span')
        
        # authors
        #citing_authors = citing_inform[0].find_elements(By.CSS_SELECTOR, 'span')
        citing_authors = citing_list[i].find_element(By.CSS_SELECTOR, 'span[class="entryAuthor"]').find_elements(By.CSS_SELECTOR, 'span')
        len_citing_authors = len( citing_authors )
        ca = citing_authors[0].text
        for k in range(1,len_citing_authors):
            ca = ca + "," + citing_authors[k].text
        print( ca )
        author_info.append( ca )
        # title
        author_info.append( citing_inform[1].text )
        # journal
        author_info.append( citing_list[i].find_element(By.CSS_SELECTOR, 'span[class="seriesTitle"]').text.replace(',','').replace(' ','') )
        #author_info.append( citing_inform[2].text.replace(',','').replace(' ','') )
        # doi
        #author_info.append( citing_list[i].find_element(By.CSS_SELECTOR, 'span[class="doi"]').text.replace(',','').replace(' ','') )
        author_info.append( citing_inform[3].text.replace(',','').replace(' ','') )
        # volume
        try:
            author_info.append( citing_list[i].find_element(By.CSS_SELECTOR, 'span[class="volume"]').find_element(By.CSS_SELECTOR, 'b').text )
        except NoSuchElementException:
            print("No volume")
        # issue
        try:
            author_info.append( citing_list[i].find_element(By.CSS_SELECTOR, 'span[class="issue"]').text.replace(',','').replace(' ','') )
        except NoSuchElementException:
            print("No issue")
        # year
        author_info.append( citing_list[i].find_element(By.CSS_SELECTOR, 'span[class="pub-date"]').text.replace(',','').replace(' ','').replace('(','').replace(')','') )
        
        print( author_info )
        
        # add author_info to authors_info
        authors_info.append( author_info )       

    #except NoSuchElementException:
    #    print("No citation")

    driver.quit()

    return( authors_info )
