# Generated by cucumber-sinatra. (2015-04-20 21:16:53 +0100)

ENV['RACK_ENV'] = 'Test'

require File.join(File.dirname(__FILE__), '..', '..', 'app/server.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = RockPaperScissors

class RockPaperScissorsWorld

  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers

end

World do
  RockPaperScissorsWorld.new
end
