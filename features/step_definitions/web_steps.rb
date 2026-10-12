# Steps genéricos (imperativos): cada um corresponde a uma ação do usuário na página.

Given(/^I am on (.+)$/) do |page_name|
  visit path_to(page_name)
end

When(/^I follow "([^"]*)"$/) do |link|
  click_link(link)
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in(field, with: value)
end

When(/^I select "([^"]*)" from "([^"]*)"$/) do |value, field|
  select(value, from: field)
end

When(/^I press "([^"]*)"$/) do |button|
  click_button(button)
end

Then(/^I should be on (.+)$/) do |page_name|
  expect(URI.parse(current_url).path).to eq(path_to(page_name))
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content(text)
end
