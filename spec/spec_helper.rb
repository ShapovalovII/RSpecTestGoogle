require 'capybara/rspec'
require 'selenium-webdriver'
require 'capybara/dsl'

$driver_path

case RbConfig::CONFIG["host_os"]
when /mingw32|windows/i
  $driver_path = "Drivers\\chromedriver.exe"
when /darwin/i
  $driver_path = "Drivers/chromedriverMac"
else
  p "OS is not defined"
end

Capybara.register_driver :driver do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :driver_path => $driver_path)
end

Capybara.default_driver = :driver

 include Capybara::DSL
Capybara.default_max_wait_time = 10

# RSpec.configure do |config|
#
# end
