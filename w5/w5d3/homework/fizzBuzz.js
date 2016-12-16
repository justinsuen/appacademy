function fizzBuzz(array) {
  const res = [];
  for (let i = 0; i < array.length; i++) {
    if (array[i] % 3 === 0 || array[i] % 5 === 0 && array[i] % 15 !== 0) {
      res.push(array[i]);
    }
  }
  return res;
}

console.log(fizzBuzz([1,2,3,4,5,15]));
