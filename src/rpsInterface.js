var player = new Player('ed');


function choice(){
  $('#choice').html(player.pick);
};
$(document).ready(function(){

choice();

  $('#buttonRock').click(function(){
    player.picks('rock');
    console.log(player.pick)
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
});