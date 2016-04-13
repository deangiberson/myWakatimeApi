World(Rack::Test::Methods)

Given(/^that the user "([^"]*)" is using api key "([^"]*)"$/) do |username, apikey|
  header 'Authorization', 'Token token='+apikey
end

When(/^I GET "([^"]*)"$/) do |path|
  #get path
  get path, nil, :authorization => %{Token token=88144fc51182cfa77a6ddae039dab97a}
end

Given(/^I send and accept JSON$/) do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
end

Then(/^I should get a response of (\d+)$/) do |status|
  last_response.status.should == status.to_i
end
