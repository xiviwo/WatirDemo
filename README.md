Watir and Cucumber Example Demo
============
Watir and cucumber is very nice web automation test tool to work with, here I would provide as simple demo application based on official watir example.

##Output
```bash
Feature: Hello Cucumber
As a product manager
I want our users to input value and submit the form
So that they can see successful msg

  Scenario: User sees the successful message # features/hello.feature:6
    When I go to the homepage                # features/step_definitions/hello.rb:10
    Then I can input mutiple value           # features/step_definitions/hello.rb:15
    Then I can submit                        # features/step_definitions/hello.rb:28
    Then I should see the successful message # features/step_definitions/hello.rb:33
      true

1 scenario (1 passed)
4 steps (4 passed)
0m4.215s
```

##Installation for Watir
Install watir and driver as below, we are assuming "Ruby" and "rubygems" have been installed by you
```bash
gem install watir --no-rdoc --no-ri
gem install watir-webdriver --no-rdoc --no-ri
```

##Installation for Cucumber
```bash
gem install cucumber --no-rdoc --no-ri
```

##Initialization your project
```bash
mkdir myproj
cd myproj
cucumber init
```
##Edit env.rb
```ruby
require 'rubygems'
require 'watir'
require 'watir-webdriver'
browser = Watir::Browser.new

Before do
  @browser = browser
end
 
at_exit do
  browser.close
end
```

##Edit Features
Inside folder feature, edit "hello.feature"
```bash
Feature: Hello Cucumber
As a product manager
I want our users to input value and submit the form
So that they can see successful msg

Scenario: User sees the successful message
When I go to the homepage
Then I can input mutiple value
Then I can submit
Then I should see the successful message
```

##Edit Steps
Inside features/step_definitions, edit block of ruby code to match each steps of on scenario.
```ruby
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
```

##Done 
Run cucumber in the project folder, you will see the expect result.
```bash
cucumber
```

