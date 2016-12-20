
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

function Asteroid () {}
Asteroid.inherits(MovingObject);

Asteroid.prototype.break = function() {
  console.log("KABOOM");
};

const mover = new MovingObject();
const asty = new Asteroid();

console.log(Asteroid.prototype instanceof MovingObject);
console.log(mover.size);
