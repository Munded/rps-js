class Game

  include DataMapper::Resource

  property :id, Serial

  belongs_to :player1, 'User'
  belongs_to :player2, 'User'

end