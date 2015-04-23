describe("Rock-Paper-Scissors", function() {

  var player1, player2, game;

  beforeEach(function() {
    player1 = new Player('Ed');
    player2 = new Player2();
    game = new Game(player1, player2);
  });

  describe('winning and losing', function() {
    describe('rock', function() {
      it('should beat scissors', function() {
        player1.picks('rock');
        player2.pick = 'scissors';
        expect(game.winner(player1, player2)).toBe(player1);
      });

      it('should lose to paper', function() {
        player1.picks('rock');
        player2.pick = 'paper';
        expect(game.winner(player1, player2)).toBe(player2);
      });

    });

    describe('paper', function() {
      it('should beat rock', function() {
        player1.picks('paper');
        player2.pick = 'rock';
        expect(game.winner(player1, player2)).toBe(player1);
      });

      it('should lose to scissors', function() {
        player1.picks('paper');
        player2.pick = 'scissors';
        expect(game.winner(player1, player2)).toBe(player2);
      });
    });

    describe('scissors', function() {
      it('should beat paper', function() {
        player1.picks('scissors');
        player2.pick = 'paper';
        expect(game.winner(player1, player2)).toBe(player1);
      });

      it('should lose to rock', function() {
        player1.picks('scissors');
        player2.pick = 'rock';
        expect(game.winner(player1, player2)).toBe(player2);
      });
    });
  });

  describe('draws', function() {
    describe('any identical picks', function() {
      it('should result in no winner', function() {
        var drawGameResults = ['rock', 'paper', 'scissors'].map(function(x) {
          player1.picks(x);
          player2.pick = x;
          return game.winner(player1, player2);
        });
        expect(drawGameResults).toEqual([null, null, null]);
      });
    });
  });
});