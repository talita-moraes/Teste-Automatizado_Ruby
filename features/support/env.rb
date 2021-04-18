require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'faker'
require 'capybara/rspec/matchers'
require 'site_prism'
require_relative 'page_helper.rb'

World(Capybara::DSL)
World(Capybara::RSpecMatchers)
World(Pages)

BROWSER = ENV['BROWSER']
ENVIRONMENT = ENV['ENVIRONMENT']
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT}.yml")

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 130
  Capybara.page.driver.browser.manage.window.maximize
end
