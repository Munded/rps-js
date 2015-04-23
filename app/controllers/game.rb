class RockPaperScissors

  post '/game/new' do
    Game.create(player1: current_user,
                player2: current_user)
    redirect to '/game'
  end

  post '/game/join' do
    Game.update(player2_id: current_user)
    redirect to '/game'
  end

  get '/game' do
    user = User.first(id: session[:user_id])
    @game = Game.first(player1: user) || Game.first(player2: user)
    erb :game
  end

end