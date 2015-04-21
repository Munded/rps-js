function Player(name){
  this.name = name;
  this.pick = "";
  this.winCount = 0
};

Player.prototype.picks = function(choice) {
  this.pick = choice;
};

function Game(player1, player2){
  this.player1 = player1;
  this.player2 = player2;
};

Game.prototype.winner = function(player1, player2) {
  if (player1.pick === 'rock' && player2.pick === 'scissors') {
    return this.player1;
    player1.winCount ++
  };

  if (player1.pick === 'scissors' && player2.pick === 'paper') {
    return this.player1;
    player1.winCount ++
  };

  if (player1.pick === 'paper' && player2.pick === 'rock') {
    return this.player1;
    player1.winCount ++
  };

  if (player1.pick === player2.pick){
    return null
  };

  if ((player1.pick !== player2.pick) && Game.winner !== player1){
    return this.player2;
    player2.winCount ++
  };


};

Game.prototype.hasWon = function(player1, player2) {
  if(player1.winCount === 3){
    return "Player 1 has won"
  } 
  else if(player2.winCount === 3){
    return "Player 2 has won"
  }
  else{return nil}
};

