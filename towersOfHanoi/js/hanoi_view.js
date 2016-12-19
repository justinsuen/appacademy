class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    // this.bindEvents();
  }

  bindEvents() {
    this.$el.on('click', 'li',  event => {
      const square = event.currentTarget;
      const $square = $(square);
      this.makeMove($square);
    });
  }

  makeMove($square) {
    let pos = $square.data('pos');


  }

  setupBoard() {
    let $uls = $(".hanoi");
    for(let i = 0; i < 3; i++) {
      let $ul = $('<ul></ul>');
      for(let j = 0; j < 3; j++) {
        let $li = $('<li></li>');
        $li.data('pos', [i, j]);
        $ul.append($li);
      }
      $uls.append($ul);
    }
    return $uls;
  }
}

module.exports = View;
