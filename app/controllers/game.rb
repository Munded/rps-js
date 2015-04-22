class RockPaperScissors

  post '/game/new' do
    @game = Game.create(player1: current_user,
                        player2: current_user)
    erb :'game/new'
  end

  post '/game/join' do
    ejs :'game/play'
  end

  get '/game/play' do
    ejs :'game/play'
  end

end