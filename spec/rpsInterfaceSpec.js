describe('rock-paper-scissors interface', function(){

    var player1

  beforeEach(function() {
    jasmine.getFixtures().fixturesPath = './';
    loadFixtures('index.html');
    player1 = new Player('Ed');
  });

  describe('making a move', function(){

    it('can pick Rock', function(){
      $('#buttonRock').click();
      console.log(player1)
      expect('#choice').toContainText('rock')
    });

    it('can pick Paper', function(){
      $('#buttonPaper').click();
      expect(player1.pick).toBe('paper')
    });

    it('can pick Scissors', function(){
      $('#buttonScissors').click();
      expect(player1.pick).toBe('scissors')
    });

    it('choice will appear on screen', function(){
      $('#buttonRock').click();
      expect('#choice').toContainText('rock');
    });

  });

});