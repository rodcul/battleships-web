# Generated by cucumber-sinatra. (2015-05-11 22:07:26 +0100)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'lib/battleships.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = BattleShipsApp

class BattleShipsWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  BattleShipsWorld.new
end
