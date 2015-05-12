require 'sinatra'
require 'battleships'
require './lib/ship'

  get '/' do
      ship = Ship.new :cruiser
      puts ship.inspect
  end

  get '/agent' do
    "you're using #{request.user_agent}"
  end
