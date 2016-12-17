const Asteroid = require('./asteroid.js');

function Game () {
  this.DIM_X = 1200;
  this.DIM_Y = 800;
  this.NUM_ASTEROIDS = 15;
  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.addAsteroids = function () {
  for (let i = 0; i < this.asteroids.length; i++) {
    let pos = this.randomPosition();
    this.asteroids.push(new Asteroid(pos, this));
  }
};

Game.prototype.randomPosition = function () {
  const x = Math.floor(this.DIM_X * Math.random());
  const y = Math.floor(this.DIM_Y * Math.random());
  return [x, y];
};

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);

  for (let i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].draw(ctx);
  }
};

Game.prototype.moveObjects = function () {
  for (let i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].move();
  }
};

Game.prototype.wrap = function (pos) {
  let x = pos[0];
  let y = pos[1];
  let dx = this.DIM_X;
  let dy = this.DIM_Y;

  return [((x % dx) + dx) % x, ((y % dy) + dy) % y];
};

Game.prototype.checkCollisions = function () {
  for (let i = 0; i < this.asteroids.length; i++) {
    for (let j = 0; j < this.asteroids.length; j++) {
      if (i === j) {
        continue;
      } else if (this.asteroids[i].isCollidedWith(this.asteroids[j])) {
        alert("COLLISION");
      }
    }
  }
};

Game.prototype.step = function () {
  this.moveObjects();
  this.checkCollisions();
};

module.exports = Game;
