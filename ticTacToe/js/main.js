const View = require("./ttt-view.js");
const Game = require("./game.js");

$( () => {
  // Your code here
  let $board = $(".ttt");
  let game = new Game();
  let view = new View(game, $board);
});
