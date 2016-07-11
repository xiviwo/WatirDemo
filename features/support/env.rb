require 'rubygems'

require 'watir'

require 'watir-webdriver'

#browser = Watir::Browser.new
browser = Watir::Browser.new



Before do
  @browser = browser
end
 
at_exit do
  browser.close
end