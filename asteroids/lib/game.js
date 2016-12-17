const Asteroid = require('./asteroid.js');

function Game () {
  this.DIM_X = 800;
  this.DIM_Y = 500;
  this.NUM_ASTEROIDS = 15;
  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.addAsteroids = function () {
  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
    let pos = this.randomPosition();
    this.asteroids.push(new Asteroid(pos));
  }
};

Game.prototype.randomPosition = function () {
  const x = Math.floor(this.DIM_X * Math.random());
  const y = Math.floor(this.DIM_Y * Math.random());
  return [x, y];
};

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);

  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
    this.asteroids[i].draw(ctx);
  }
};

Game.prototype.moveObjects = function () {
  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
    this.asteroids[i].move();
  }
};

module.exports = Game;
