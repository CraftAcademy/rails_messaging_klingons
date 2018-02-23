require 'cucumber/rails'

Chromedriver.set_version '2.33'

World(FactoryBot::Syntax::Methods)

ActionController::Base.allow_rescue = false
Capybara.register_driver :selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new(
      args: %w( headless disable-popup-blocking disable-infobars)
  )

  Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      options: options
  )
end

Capybara.javascript_driver = :selenium
begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation
