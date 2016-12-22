const APIUtil = require("./api_util.js");
const FollowToggle = require('./follow_toggle.js');

class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.$ul = this.$el.find("ul.users");
    this.$input = this.$el.find("input");
    this.$input.on("input", () => this.handleInput());
  }

  handleInput() {
    APIUtil.searchUsers(this.$input.val())
      .then(users => {
        this.renderUsers(users);
      });
  }

  renderUsers(users) {
    // debugger;
    this.$ul.empty();
    for (let i = 0; i < users.length; i++) {
      let button = '<button class="follow-toggle" type="button"></button>';
      let $li = $(`<li>${users[i].username} ${button}</li>`);
      this.$ul.append($li);
    }

    const $buttons = $(".follow-toggle");
    for (let j = 0; j < $buttons.length; j++) {
      let $button = $buttons[j];
      let followState = users[j].followed ? "followed" : "unfollowed";
      const followToggle = new FollowToggle($button, {userId: users[j].id, followState: followState});
    }
  }
}

module.exports = UsersSearch;
