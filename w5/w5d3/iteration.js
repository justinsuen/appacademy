Array.prototype.bubbleSort = function() {
  let sorted = false;

  while (!sorted) {
    sorted = true;

    for (let i = 0; i < this.length-1; i++) {
      let temp = this[i];
      if (this[i] > this[i+1]) {
        this[i] = this[i+1];
        this[i+1] = temp;
        sorted = false;
      }
    }
  }

  return this;
};

// console.log([1,4,5,3,2].bubbleSort());

String.prototype.substrings = function() {
  const subs = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = i+1; j < this.length+1; j++) {
      subs.push(this.slice(i,j));
    }
  }

  return subs;
};

console.log("string".substrings());
