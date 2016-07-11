

require 'rubygems'

require 'watir'

require 'watir-webdriver'


When(/^I go to the homepage$/) do
  @browser.goto 'http://bit.ly/watir-example'
end


Then(/^I can input mutiple value$/) do
  	@browser.text_field(:name => 'entry.1000000').set 'Watir'

	@browser.textarea(:name => 'entry.1000001').set "I come here from Australia. \n The weather is great here."
	@browser.radio(:value => 'Watir').set
	@browser.checkbox(:value => 'Ruby').set
	@browser.checkbox(:value => 'Python').set
	@browser.checkbox(:value => 'Python').clear

	@browser.select_list(:name => 'entry.1000004').select 'Chrome'

end

Then(/^I can submit$/) do
  @browser.button(:name => 'submit').click
end


Then(/^I should see the successful message$/) do
  puts @browser.text.include? 'Your response has been recorded.'
end


