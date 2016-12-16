// import {Board} from 'board.js';

class Game{
  constructor(player1, player2){
    this.currentPlayer = player1;
    this.nextPlayer = player2;
    // this.board = new Board();
  }

  switch_player(){
    let temp = this.currentPlayer;
    this.currentPlayer = this.nextPlayer;
    this.nextPlayer = this.currentPlayer;
  }

  play(){
    let position = this.currentPlayer.prompt();


  }
}
