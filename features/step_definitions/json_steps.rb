World(Rack::Test::Methods)

Then(/^I should receive a valid user object$/) do
  result = JSON.parse(last_response.body)
  result['data'].should_not == nil
end

Then(/^I should receive a valid duration object$/) do
  result = JSON.parse(last_response.body)
  result['data'].should_not == nil
  result['branches'].should_not == nil
end

Then(/^I should receive a valid stats object$/) do
  result = JSON.parse(last_response.body)
  result['data'].should_not == nil
end

Then(/^the user "([^"]*)" should equal "([^"]*)"$/) do |field, value|
  result = JSON.parse(last_response.body)
  result['data'][field].should == value
end

Then(/^I should receive a JSON error with "([^"]*)" as the body$/) do |value|
  result = JSON.parse(last_response.body)
  result['error'].should == value
end
