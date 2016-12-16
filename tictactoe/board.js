
const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


const diags = [[0,0], [1,1], [2,2]];
const diags2 = [[0,2], [1,1], [2,0]];

class Board{
  constructor(){
    this.board = Board.make_grid();
  }

  static make_grid(){
    let board = [];
    for (let i = 0; i < 3; i++) {
      board.push([]);
      for (let j = 0; j < 3; j++) {
        board[i].push(null);
      }
    }
    return board;
  }

  empty(row, col){
    if(this.board[row][col] === '_'){
      return true;
    }
    return false;
  }

  won(){
    let that = this;
    for(let i = 0; i < this.board.length; i++){
      if ((this.board[i][0] !== null) &&
      (this.board[i][0] === this.board[i][1]) &&
      (this.board[i][1] === this.board[i][2])){
        return true;
      } else if ((this.board[0][i] !== null) &&
      (this.board[0][i] === this.board[1][i]) &&
      (this.board[1][i] === this.board[2][i])){
        return true;
      } else {
        let three = diags.map(function(el){
          let x = el[0];
          let y = el[1];
          return that.board[x][y];
        });
        let three2 = diags2.map(function(el){
          let x = el[0];
          let y = el[1];
          return that.board[x][y];
        });

        if(three[0] !== null && three[0] === three[1] && three[1] === three[2]){
          return true;
        } else if(three2[0] !== null && three2[0] === three2[1] && three2[1] === three2[2]){
          return true;
        }
      }
    }
    return false;
  }

  winner(){
    console.log(`${this} wins!`);
  }

  place_mark(row, col, mark){
    if (this.empty(row, col)) {
      this.board[row][col] = mark;
    } else {
      console.log("Invalid move!");
    }
  }
}

// export {Board};

const board = new Board();

console.log(board.won());
// console.log(Board.make_grid());
