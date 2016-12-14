function myRange(start, end) {
  if (end < start) {
    return [];
  }
  if (start === end) {
    return [end];
  }
  return [start].concat(myRange(start+1, end));
}

// console.log(myRange(3,2));

function exp1(b, n) {
  if (n === 0) {
    return 1;
  }
  return b * exp1(b, n-1);
}


function exp2(b,n) {
  if (n===0) {
    return 1;
  }
  if (n % 2 === 0) {
    return Math.pow(exp2(b, n/2),2);
  }
  else {
    return b * Math.pow((exp2(b, (n-1)/2)),2);
  }
}
//
// console.log(exp2(2,4));

function fib(n) {
  if (n===1) {
    return [1];
  }
  else if (n===2) {
    return [1, 1];
  }
  else {
    let prev = fib(n-1);
    let num = prev[prev.length-2] + prev[prev.length-1];
    return prev.concat([num]);
  }
}

// console.log(fib(5));

function bsearch(array, target) {
  let mid = Math.floor(array.length / 2);

  if (array[mid] === target) {
    return mid;
  } else if (array.length === 1 && array !==[target]) {
    return NaN;
  }

  if (target <= array[mid]) {
    return bsearch(array.slice(0, mid), target);
  } else {
    return bsearch(array.slice(mid, array.length), target) + mid;
  }
}
//
// console.log(bsearch([1, 2, 3], 1));
// console.log(bsearch([2, 3, 4, 5], 3));
// console.log(bsearch([2, 4, 6, 8, 10], 6));
// console.log(bsearch([1, 3, 4, 5, 9], 5));
// console.log(bsearch([1, 2, 3, 4, 5, 6], 6));
// console.log(bsearch([1, 2, 3, 4, 5, 6], 0));
// console.log(bsearch([1, 2, 3, 4, 5, 7], 6));


function makeChange(target, bank) {
  if (bank.includes(target)) {
    return [target];
  }

  let bestChange = null;

  for (let i = 0; i < bank.length; i++) {
    const coin = bank[i];

    if (coin > target) {
      continue;
    }

    let remAmount = target - coin;
    let tempChange = makeChange(remAmount, bank);

    if (bestChange === null || tempChange.length < bestChange.length) {
      bestChange = tempChange.concat([coin]);
    }
  }

  return bestChange;
}

// console.log(makeChange(12, [10,7,1]));
// console.log(makeChange(14, [10,7,1]));

//
function mergeSort(array) {
  if (array.length === 1) {
    return array;
  }

  let mid = Math.floor(array.length / 2);
  let left = array.slice(0, mid);
  let right = array.slice(mid, array.length);

  return merge(mergeSort(left),mergeSort(right));
}

function merge(left, right) {
  const res = [];
  while(left.length > 0 && right.length > 0) {
    if (left[0] < right[0]) {
      res.push(left.shift(1));
    } else {
      res.push(right.shift(1));
    }
  }
  return res.concat(left).concat(right);
}

// console.log(mergeSort([1,23,43,2,6,7,3]));
// console.log(mergeSort([53,43]));


function subsets(array) {
  if (array.length === 0) {
    return [[]];
  }

  const first = [array.pop()];
  const prevSubs = subsets(array);
  let res = prevSubs.slice(0);

  for (let i = 0; i < prevSubs.length; i++) {
    res.push(prevSubs[i].concat(first));
  }

  return res;
}

console.log(subsets([1,2,3]));
