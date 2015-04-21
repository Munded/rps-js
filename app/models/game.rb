class Game

  include DataMapper::Resource

  has n, :user, through: Resource

  property :player1, Serial
  property :player2, Serial

end