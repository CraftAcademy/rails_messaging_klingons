Given("The following users exist") do |table|
  table.hashes.each do |user|
    FactoryBot.create(:user, user)
  end
end

Given("I am logged in as {string}") do |name|
  user = User.find_by(name: name)
  login_as(user, scope: :user)
end

Given("I am on the inbox page") do
  visit mailbox_inbox_path #mailbox/inbox
end

Then("I click the {string} button") do |element|
  click_button(element)
end

Then("I select {string} as {string}") do |user, list|
  select(user, from: list)
end

Then("I type in {string} in field for {string}") do |text, element|
  fill_in(element, with: text)
end

Then("I should see {string} on my screen") do |text|
  expect(page).to have_content text
end

Given("show me the page") do
  save_and_open_page
end

Then("I click the {string} link") do |element|
  click_link(element)
end

Then("I accept the alert") do
  accept_alert
end
