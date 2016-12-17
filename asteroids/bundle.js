/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const GameView = __webpack_require__(1);


	document.addEventListener("DOMContentLoaded", function() {
	    let canvas = document.getElementById("game-canvas");
	    let ctx = canvas.getContext("2d");

	    const gv = new GameView(ctx);
	    gv.start();
	  });


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	const Game = __webpack_require__(2);


	function GameView (ctx) {
	  this.game = new Game();
	  this.ctx = ctx;
	}

	GameView.prototype.start = function () {
	  const that = this;
	  setInterval(function () {
	    that.game.moveObjects();
	    that.game.draw(that.ctx);
	  }, 20);
	};

	module.exports = GameView;


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	const Asteroid = __webpack_require__(3);

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


/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	const Util = __webpack_require__(4);
	const MovingObject = __webpack_require__(5);

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


/***/ },
/* 4 */
/***/ function(module, exports) {

	const Util = {
	  inherits (childClass, parentClass) {
	    function Surrogate() {}

	    Surrogate.prototype = parentClass.prototype;
	    childClass.prototype = new Surrogate();
	    childClass.prototype.constructor = childClass;
	  },

	  // Return a randomly oriented vector with the given length.
	  randomVec (length) {
	    const deg = 2 * Math.PI * Math.random();
	    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
	  },

	  // Scale the length of a vector by the given amount.
	  scale (vec, m) {
	    return [vec[0] * m, vec[1] * m];
	  }
	};

	module.exports = Util;


/***/ },
/* 5 */
/***/ function(module, exports, __webpack_require__) {

	const Util = __webpack_require__(4);

	function MovingObject (options) {
	  this.pos = options.pos;
	  this.vel = options.vel;
	  this.radius = options.radius;
	  this.color = options.color;
	}

	MovingObject.prototype.draw = function(ctx) {
	  ctx.fillStyle = this.color;
	  ctx.beginPath();

	  ctx.arc(
	    this.pos[0],
	    this.pos[1],
	    this.radius,
	    0,
	    2 * Math.PI,
	    false
	  );

	  ctx.fill();
	};

	MovingObject.prototype.move = function () {
	  this.pos[0] += this.vel[0];
	  this.pos[1] += this.vel[1];
	};

	module.exports = MovingObject;


/***/ }
/******/ ]);