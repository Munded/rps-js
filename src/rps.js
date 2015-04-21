function Player(name){
  this.name = name;
  this.pick = "";
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
  };

  if (player1.pick === 'scissors' && player2.pick === 'paper') {
    return this.player1;
  };

  if (player1.pick === 'paper' && player2.pick === 'rock') {
    return this.player1;
  };

  if (player1.pick === player2.pick){
    return null
  };

  if ((player1.pick !== player2.pick) && Game.winner !== player1){
    return this.player2;
  };


};

