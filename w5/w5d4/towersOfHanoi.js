const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor() {
    this.stacks = [[3,2,1],[],[]];
  }

  run() {
    console.log(this.stacks);
    let startDisc;
    let endDisc;

    let that = this;
    if (!this.win()) {
      reader.question("Starting stack: ", function(startTowerIdx) {
        startDisc = that.stacks[startTowerIdx].pop();
        reader.question("End stack: ", function(endTowerIdx) {
          if(that.isValidMove(startTowerIdx, endTowerIdx)){
            that.stacks[endTowerIdx].push(startDisc);
            console.log(that.stacks);
          } else {
            console.log("Invalid Move!!");
            that.stacks[startTowerIdx].push(startDisc);
          }
          that.run();
        });
      });
    } else {
      console.log("You won!");
      reader.close();
    }
  }

  isValidMove(startTowerIdx, endTowerIdx) {
    let startTower = this.stacks[startTowerIdx];
    let endTower = this.stacks[endTowerIdx];
    if (startTower[startTower.length-1] > endTower[endTower.length-1]) {
      return false;
    }
    return true;
  }

  win(){
    if(this.stacks[2].length === 3 || this.stacks[1].length === 3){
      return true;
    }
    return false;
  }
}

const game = new Game();
game.run();
