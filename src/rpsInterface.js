var player = new Player(name);


function choice(){
  $('#choice').html(player.pick);
};

choice();

$('#buttonRock').click(function(){
  player.picks('rock');
  choice();
});

$('#buttonPaper').click(function(){
  player.picks('paper');
  choice();
});

$('#buttonScissors').click(function(){
  player.picks('scissors');
  choice();
});