require 'sinatra'
require 'battleships'

class BattleShipsApp < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }

  @@game = Game.new Player, Board
  @board = @@game.own_board_view @@game.player_1

  get '/' do
    @board = @@game.own_board_view @@game.player_1
    p @@game.object_id
    erb :index
  end

  get '/ship/new' do
    p @@game.object_id
    erb :place
  end

  post '/ship' do
    @coordinate = params['coordinate'].capitalize
    @orientation = params['orientation'].to_sym
    @@game.player_1.place_ship Ship.cruiser, @coordinate, @orientation
    @board = @@game.own_board_view @@game.player_1
    erb :index
  end

  get '/board' do
    test = @@game.object_id
    @board = @@game.own_board_view @@game.player_1
    erb :board
  end

  post '/fire' do
    @coordinate = params['coordinate'].capitalize
    @@game.player_2.shoot @coordinate.to_sym
    @haveiwon = @@game.player_2.winner?

    @board = @@game.own_board_view @@game.player_1
    erb :fire
  end

  get '/fire' do
    @haveiwon = @@game.player_2.winner?
    @board = @@game.own_board_view @@game.player_1
    erb :fire
  end



  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
