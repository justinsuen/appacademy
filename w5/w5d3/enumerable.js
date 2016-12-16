Array.prototype.myEach = function (func) {
  for (let i = 0; i < this.length; i++) {
    func(this[i]);
  }
};

const double = function(num) {
  return (num * 2);
};

[1,2,3,4].myEach(double);
// console.log(myEach([1,2,3,4], double));

Array.prototype.myMap = function (func) {
  const res = [];
  this.myEach((el) => {
    res.push(func(el));
  });
  return res;
};

// console.log([1,2,3,4].myMap(double));

Array.prototype.myInject = function (func) {
  let accumulator = this[0];
  this.slice(1).myEach((el) => {
    accumulator = func(accumulator, el);
  });
  return accumulator;
};

const adder = function(acc, num) {
  return acc + num;
};

console.log([1,2,3,4].myInject(adder));
