function uniq(array) {
  const res = [];
  for(let i =0; i < array.length; i++){
    if (res.indexOf(array[i]) === -1) {
      res.push(array[i]);
    }
  }
  return res;
}

// console.log(uniq([1,2,3,4,4,5,6,2,4]));

function twoSum(array) {
  const res = [];
  for(let i=0; i < array.length; i++) {
    for(let j = i + 1; j < array.length; j++) {
      if (array[i] + array[j] === 0) {
        res.push([i, j]);
      }
    }
  }
  return res;
}
//
// console.log(twoSum([-1, 0, 2, -2, 1]));

function transpose(matrix) {
  const res = [];
  for(let i=0; i < matrix[0].length; i++) {
    let row = [];
    for(let j=0; j < matrix.length; j++) {
      row.push(matrix[j][i]);
    }
    res.push(row);
  }
  return res;
}

console.log(transpose([
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]));
