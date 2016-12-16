function Cat(name, owner){
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function() {
  console.log(`${this.owner} loves ${this.name}!`);
};

Cat.prototype.meow = function() {
  console.log('Meow');
};

const c1 = new Cat("Earl", "John");
const c2 = new Cat("Fluffy", "Steve");

c1.meow = function() {
  console.log('Meow, Meow');
};

c1.cuteStatement();
c1.meow();
c2.meow();
