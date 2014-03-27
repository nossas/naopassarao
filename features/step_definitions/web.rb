When(/^I go to "(.*?)"$/) do |arg1|
  visit to_url(arg1)
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_css(to_element(arg1))
end
