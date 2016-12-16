
Function.prototype.inherits = function (superClass) {
  function Surrogate() {}

  Surrogate.prototype = superClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

function MovingObject () {
}

MovingObject.prototype.move = function () {
  console.log("I'm moving");
};

function Ship () {}
Ship.inherits(MovingObject);

function Asteroid () {
  this.size = 300;
}
Asteroid.inherits(MovingObject);

Asteroid.prototype.break = function() {
  console.log("KABOOM");
};

const mover = new MovingObject();
const asty = new Asteroid();

console.log(asty.size);
console.log(mover.size);
