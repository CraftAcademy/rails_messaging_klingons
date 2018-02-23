Given("I am on the landing page") do
  visit root_path
end

Given("I am on the Login page") do
    visit new_user_session_path
end

Given("I am on the Sign up page") do
  visit new_user_registration_path
end

Given("the following user exists") do |table|
  table.hashes.each do |user|
    FactoryBot.create(:user, user)
  end
end

When("I click {string}") do |button|
  click_link_or_button button
end

When("I fill in {string} with {string}") do |field, input|
  fill_in field, with: input
end

Then("I should see the message {string}") do |message|
  expect(page).to have_content(message)
end

When("show me the page") do
  save_and_open_page
end
