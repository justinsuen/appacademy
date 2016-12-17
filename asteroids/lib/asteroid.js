const Util = require('./utils.js');
const MovingObject = require('./moving_object.js');

function Asteroid (pos) {
  this.COLOR = "#900C3F";
  this.RADIUS = 8;
  MovingObject.call(this, {
    pos: pos,
    vel: Util.randomVec(1),
    color: this.COLOR,
    radius: this.RADIUS
  });
}
Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
