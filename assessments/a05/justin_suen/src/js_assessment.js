// write String.prototype.mySlice. It should take a start index and an
// (optional) end index.
String.prototype.mySlice = function (start, end = this.length) {
  let res = "";

  if (end > this.length) {
    end = this.length;
  }

  for (let i = start; i < end; i++) {
    res += this[i];
  }

  return res;
};

// write Array.prototype.myReduce (analogous to Ruby's Array#inject).
Array.prototype.myReduce = function (callback) {
  let accum = this[0];

  for (let i = 1; i < this.length; i++) {
    accum = callback(accum, this[i]);
  }

  return accum;
};

// write Array.prototype.quickSort(comparator). Here's a quick refresher if
// you've forgotten how quickSort works:
//   - choose a pivot element from the array (usually the first)
//   - for each remaining element of the array:
//     - if the element is less than the pivot, put it in the left half of the
//     array.
//     - otherwise, put it in the right half of the array.
//   - recursively call quickSort on the left and right halves, and return the
//   full sorted array.
Array.prototype.quickSort = function (comparator = (x, y) => {
    if (x === y) {
      return 0;
    } else if (x < y) {
      return -1;
    } else {
      return 1;
    }
  }) {

  if (this.length === 1 || this.length === 0) {
    return this;
  }

  let pivot = this[0];
  let left = [];
  let right = [];

  for (let i = 1; i < this.length; i++) {
    if (comparator(this[i], pivot) === -1) {
      left.push(this[i]);
    } else {
      right.push(this[i]);
    }
  }

  left = left.quickSort(comparator);
  right = right.quickSort(comparator);

  return left.concat([pivot]).concat(right);
};

// write myFind(array, callback). It should return the first element for which
// callback returns true, or undefined if none is found.
function myFind(array, callback) {
  for (let i = 0; i < array.length; i++) {
    if (callback(array[i]) === true) {
      return array[i];
    }
  }
  return undefined;
}


// write sumNPrimes(n)
function sumNPrimes(n) {
  let sum = 0;
  let i = 2;

  while (n > 0) {
    let isPrime = true;

    for (let j = 2; j < i; j++) {
      if (i % j === 0 && i !== j) {
        isPrime = false;
        break;
      }
    }

    if (isPrime) {
      sum += i;
      n--;
    }

    i++;
  }

  return sum;
}

// write Function.prototype.myBind.
Function.prototype.myBind = function (...args) {
  let first = args[0];
  let bindArgs = args.slice(1);

  return (...callTimeArgs) => this.apply(first, bindArgs.concat(callTimeArgs));
};

// write Function.prototype.inherits.
Function.prototype.inherits = function (superClass) {
  function Surrogate() {}

  Surrogate.prototype = superClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};
