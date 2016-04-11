Given(/^that the user "([^"]*)" is logged in$/) do |username|
  @username = username
end

Given(/^that the user "([^"]*)" is using api key "([^"]*)"$/) do |username, apikey|
  @username = username
  @apikey = apikey
end

