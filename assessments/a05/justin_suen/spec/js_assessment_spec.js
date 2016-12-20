describe("String.prototype.mySlice", () => {
  it("slices the string from the start index to the end index", () => {
    expect("abcd".mySlice(0, 2)).toEqual("ab");
  });

  it("slices to the end of the string when no second argument is passed", () => {
    expect("foobar".mySlice(3)).toEqual("bar");
  });

  it("returns an empty string when the first argument is higher", () => {
    expect("empty!".mySlice(1, 0)).toEqual("");
  });

  it("slices to the end of the string when the end index is greater than the string's length", () => {
    expect("super long string".mySlice(0, 200)).toEqual("super long string");
  });

  it("doesn't call `substr`, `slice`, or `substring`", () => {
    const str = new String("don't you do it!");
    spyOn(str, "substr");
    spyOn(str, "slice");
    spyOn(str, "substring");

    str.mySlice(0);

    expect(str.substr).not.toHaveBeenCalled();
    expect(str.slice).not.toHaveBeenCalled();
    expect(str.substring).not.toHaveBeenCalled();
  });
});

describe("Array.prototype.myReduce", () => {
  let myArray;
  const noOp = (accum, el) => accum;

  const spy = {
    sum: (accum, el) => accum + el
  };

  it("calls the callback, passing in the accumulator and each element", () => {
    myArray = [1, 2, 3];
    spyOn(spy, "sum").and.callThrough();

    myArray.myReduce(spy.sum);

    expect(spy.sum).toHaveBeenCalledWith(1, 2);
    expect(spy.sum).toHaveBeenCalledWith(3, 3);
  });

  it("works with a sum callback", () => {
    myArray = [1, 2, 3, 4];
    expect(myArray.myReduce(spy.sum)).toEqual(10);
  });

  it("works with a multiplier callback", () => {
    myArray = [4, 4, 4];
    const times = (accum, el) => accum * el;

    expect(myArray.myReduce(times)).toEqual(64);
  });

  it("uses the first item as the accumulator", () => {
    myArray = [1, 2, 3, 4];
    expect(myArray.myReduce(noOp)).toEqual(1);
  });

  it("does not call Array.prototype.reduce", () => {
    myArray = [1, 2, 3, 4];
    spyOn(myArray, "reduce");

    myArray.myReduce(spy.sum);

    expect(myArray.reduce).not.toHaveBeenCalled();
  });
});

describe("Array#quickSort", () => {
  const array =  [1, 5, 2, 4, 3];

  it("works with an empty array", () => {
    expect([].quickSort()).toEqual([]);
  });

  it("works with an array of one item", () => {
    expect([1].quickSort()).toEqual([1]);
  });

  it("sorts numbers", () => {
    expect(array.quickSort()).toEqual(array.slice(0).sort());
  });

  it("sorts arrays with duplicates", () => {
    expect([5, 4, 3, 3, 2, 1].quickSort()).toEqual([1, 2, 3, 3, 4, 5]);
  });

  it("uses a comparator function if passed in", () => {
    const reversed = array.quickSort((x, y) => {
      if (x === y) {
        return 0;
      } else if (x < y) {
        return 1;
      } else {
        return -1;
      }
    });
    expect(reversed).toEqual([5, 4, 3, 2, 1]);
  });

  it("calls itself recursively", () => {
    spyOn(Array.prototype, "quickSort").and.callThrough();

    array.quickSort();

    const count = Array.prototype.quickSort.calls.count();
    expect(count).toBeGreaterThan(4);
    expect(count).toBeLessThan(10);
  });

  it("does not modify original", () =>{
    const dupedArray = [1, 5, 2, 4, 3];
    dupedArray.quickSort();
    expect(dupedArray).toEqual(array);
  });
});

describe("myFind", () => {
  let arr, spy;
  beforeEach(() => {
    arr = [1, 2, 3];
    spy = {
      callback: (el) => false
    };
  });

  const equalsThree = (el) => el === 3;
  const equalsFour = (el) => el === 4;

  it("calls the callback passed to it", () => {
    spyOn(spy, "callback");

    myFind(arr, spy.callback);

    expect(spy.callback).toHaveBeenCalled();
  });

  it("yields each element to the callback", () => {
    spyOn(spy, "callback");

    myFind(arr, spy.callback);

    expect(spy.callback).toHaveBeenCalledWith(1);
    expect(spy.callback).toHaveBeenCalledWith(2);
    expect(spy.callback).toHaveBeenCalledWith(3);
  });

  it("returns undefined if no element satisfies the callback", () => {
    expect(myFind(arr, equalsFour)).toEqual(undefined);
  });

  it("returns the first element for which the callback returns true", () => {
    expect(myFind(arr, equalsThree)).toEqual(3);
  });

  it("does NOT call the built in Array#find method", () => {
    Array.prototype.find = Array.prototype.find || function () {};
    spyOn(arr, "find");

    myFind(arr, equalsFour);

    expect(arr.find).not.toHaveBeenCalled();
  });
});

describe("sumNPrimes", () => {
  it("returns 0 for 0", () => {
    expect(sumNPrimes(0)).toEqual(0);
  });

  it("returns 2 for 1", () => {
    expect(sumNPrimes(1)).toEqual(2);
  });

  it("sums the first 4 primes", () => {
    expect(sumNPrimes(4)).toEqual(17);
  });

  it("sums the first 20 primes", () => {
    expect(sumNPrimes(20)).toEqual(639);
  });
});

describe("Function.prototype.myBind", () => {
  // let Cat;
  let sally, markov, curie;

  beforeEach(() => {
    class Cat {
      constructor (name) {
        this.name = name;
      }

      sayHello () {
        return this.name + " says hello!";
      }

      greetOne (otherCat) {
        return this.name + " says hello to " + otherCat.name;
      }

      greetTwo (otherCat1, otherCat2) {
        return this.name + " says hello to " + otherCat1.name + " and " +
          otherCat2.name;
      }
    }

    sally = new Cat("Sally");
    markov = new Cat("Markov");
    curie = new Cat("Curie");
  });

  it("should call the function method style on the context", () => {
    expect(sally.sayHello.myBind(sally)()).toEqual("Sally says hello!");
  });

  it("should pass in bind-time argument to the method", () => {
    expect(sally.greetOne.myBind(sally, markov)())
      .toEqual("Sally says hello to Markov");
  });

  it("should pass in two bind-time arguments to the method", () => {
    expect(sally.greetTwo.myBind(sally, markov, curie)())
      .toEqual("Sally says hello to Markov and Curie");
  });

  it("should combine bind-time and call-time arguments", () => {
    expect(sally.greetTwo.myBind(sally, markov)(curie))
      .toEqual("Sally says hello to Markov and Curie");
  });
});

describe("inherits", () => {
  let Animal, Dog, dog;

  beforeEach(() => {
    Animal = function() {
      this.name = "Yogi";
    };

    Animal.prototype.makeNoise = function() { return "Hi!"; };

    Dog = function() {
      this.age = 7;
    };

    Dog.inherits(Animal);

    Dog.prototype.bark = function() { return "Woof!"; };

    dog = new Dog();
  });

  it("should properly set up the prototype chain between a child and parent", () => {
    expect(dog.bark()).toBe("Woof!");
    expect(dog.makeNoise()).toBe("Hi!");
  });

  it("should not call the parent's constructor function", () => {
    expect(dog.name).toBeUndefined();
  });

  it("should maintain separation of parent and child prototypes", () => {
    Dog.prototype.someProperty = 42;
    const animal = new Animal();
    expect(animal.someProperty).toBeUndefined();
    expect(animal.makeNoise()).toBe("Hi!");
  });

  it("should properly work for longer inheritance chains", () => {
    const Poodle = function () { this.name = "Bill"; };

    Poodle.inherits(Dog);

    Poodle.prototype.shave = function() { return "Brrr."; };

    const poodle = new Poodle();
    expect(poodle.name).toBe("Bill");
    expect(poodle.shave()).toBe("Brrr.");
    expect(poodle.makeNoise()).toBe("Hi!");
    expect(poodle.bark()).toBe("Woof!");
  });
});
