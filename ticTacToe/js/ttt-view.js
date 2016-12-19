class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    $el.append(this.setupBoard());
  }

  bindEvents() {}

  makeMove($square) {}

  setupBoard() {
    let $ul = $('<ul></ul>');
    for(let i = 0; i < 9; i++) {
      $ul.append('<li></li>');
    }
    return $ul;
  }
}

module.exports = View;
