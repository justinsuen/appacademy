const Util = require('./utils.js');
const MovingObject = require('./moving_object.js');

function Asteroid (pos, game) {
  this.COLOR = "#900C3F";
  this.RADIUS = 8;
  MovingObject.call(this, {
    pos: pos,
    vel: Util.randomVec(1),
    color: this.COLOR,
    radius: this.RADIUS,
    game: game
  });
}
Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
