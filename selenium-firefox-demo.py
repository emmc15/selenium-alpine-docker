import time
from selenium import webdriver
from pyvirtualdisplay import Display

display = Display(visible=0, size=(800, 800))
display.start()

driver = webdriver.Firefox()
driver.get('http://www.google.com/')

time.sleep(5)
#title = driver.title
#print(title.encode('utf-8'))

html=driver.page_source
print(html)

# Release memory
driver.close()
driver.quit()
display.stop()