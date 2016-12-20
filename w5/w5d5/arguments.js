function sum() {
  let accum = 0;
  let args = Array.prototype.slice.call(arguments);

  for (let i = 0; i < args.length; i++) {
    accum += args[i];
  }

  return accum;
}

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);

function product() {
  let accum = 1;
  let args = Array.prototype.slice.call(arguments);

  for (let i = 0; i < args.length; i++) {
    accum *= args[i];
  }

  return accum;
}

function sum2(...args) {
  let accum = 0;

  for (let i = 0; i < args.length; i++) {
    accum += args[i];
  }

  return accum;
}

// console.log(sum2(1, 2, 3, 4) === 10);
// console.log(sum2(1, 2, 3, 4, 5) === 15);

Function.prototype.myBind = function (context) {
  let bindArgs = Array.prototype.slice.call(arguments, 1);

  let that = this;
  return function() {
    let callTimeArgs = Array.prototype.slice.call(arguments);
    that.apply(context, bindArgs.concat(callTimeArgs));
  };
};

Function.prototype.myBind2 = function (...args) {
  let first = args[0];
  let bindArgs = args.slice(1);

  return (...callTimeArgs) => {
    this.apply(first, bindArgs.concat(callTimeArgs));
  };
};

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");


// // Markov says meow to Ned!
// markov.says("meow", "Ned");
//
// // Breakfast says meow to Kush!
// markov.says.myBind2(breakfast, "meow", "Kush")();
//
// // Breakfast says meow to a tree!
// markov.says.myBind2(breakfast)("meow", "a tree");
//
// // Breakfast says meow to Markov!
// markov.says.myBind(breakfast, "meow")("Markov");


function curriedSum (numArgs) {
  let numbers = [];

  function _curriedSum(n) {
    numbers.push(n);

    if (numbers.length === numArgs) {
      return sum(...numbers);
    } else {
      return _curriedSum;
    }
  }

  return _curriedSum;
}
//
// const s = curriedSum(4);
// console.log(s(5)(30)(20)(1)); // => 56


Function.prototype.curry = function (numArgs) {
  let args = [];
  let that = this;

  function _curried(n) {
    args.push(n);

    if (args.length === numArgs) {
      return that(...args);
    } else {
      return _curried;
    }
  }

  return _curried;
};

const s = product.curry(4);
console.log(s(3)(3)(3)(3)); // => 81
