from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
import time # for time.sleep()

chrome_driver_path = Service('/Users/omboi/VSCode/chromedriver')
driver = webdriver.Chrome(service=chrome_driver_path)



def getHtml(website):
  driver.get(website)
  button = driver.find_element(By.TAG_NAME, 'button')
 
  print(button)