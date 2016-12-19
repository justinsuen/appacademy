class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on('click', 'ul',  event => {
      const $tower = $(event.currentTarget);
      if ($('.selected').length === 1) {
        this.makeMove($('.selected'), $tower);
      } else {
        $tower.addClass('selected');
      }
    });
  }

  makeMove($startTower, $endTower) {
    let res = this.game.move($startTower.data('pos'), $endTower.data('pos'));

    if (res === true) {
      let disc = $('.selected .disc')[0];
      let $disc = $(disc);
      let classes = $disc.attr("class");

      $endTower.children().not('.disc').last().addClass(classes);
      $startTower.removeClass('selected');
      $disc.removeClass(classes);
    } else {
      $('.selected').removeClass('selected');
      console.log('Invalid move');
    }
  }

  setupBoard() {
    let $uls = $(".hanoi");
    for(let i = 0; i < 3; i++) {
      let $ul = $('<ul></ul>');
      $ul.data('pos', i);
      for(let j = 0; j < 3; j++) {
        let $li = $('<li></li>');
        if (i === 0) {
          $li.addClass('disc').addClass(`disc${j + 1}`);
        }
        $ul.append($li);
      }
      $uls.append($ul);
    }
    return $uls;
  }
}

module.exports = View;
