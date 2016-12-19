class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    $el.append(this.setupBoard());
    this.bindEvents();
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

    if (!this.game.isOver()) {
      this.game.playMove(pos);
      $square.addClass(this.game.currentPlayer);
    }

    if(this.game.isOver()) {
      let winner = this.game.currentPlayer;
      $(`.${winner}`).addClass('winner');
      $('li').not(".winner").addClass('loser');

      let $message = $(`<h3>You win, ${winner}!</h3>`);
      this.$el.append($message);
      this.$el.off('click');
    }
  }

  setupBoard() {
    let $ul = $('<ul></ul>');
    for(let i = 0; i < 9; i++) {
      let $li = $('<li></li>');
      $li.data('pos', [Math.floor(i / 3), i % 3]);
      $ul.append($li);
    }
    return $ul;
  }
}

module.exports = View;
