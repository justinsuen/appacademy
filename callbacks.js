class Clock {
  constructor() {
    const date = new Date();
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();
  }

  printTime() {
    console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
  }

  _tick() {
    let that = this;
    setInterval(function() {
      that.seconds += 1;
      that.printTime();
    }, 1000);
  }
}

const clock = new Clock();
clock._tick();
