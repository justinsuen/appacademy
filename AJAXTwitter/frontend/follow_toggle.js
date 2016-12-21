const APIUtil = require("./api_util.js");

class FollowToggle {
  constructor(el) {
    this.el = $(el);
    this.userId = this.el.data("user-id");
    this.followState = this.el.data("initial-follow-state");

    this.el.text(this.render());
    this.handleClick();
  }

  render() {
    if (this.followState === "unfollowed") {
      return "Follow!";
    } else {
      return "Unfollow!";
    }
  }

  handleClick() {
    $(this.el).on("click", event => {
      event.preventDefault();

      if (this.followState === "unfollowed"){
        APIUtil.followUser(this.userId)
               .then(this.switchFollowState.bind(this));
      } else {
        APIUtil.unfollowUser(this.userId)
               .then(this.switchFollowState.bind(this));
      }
    });
  }

  switchFollowState() {
    if (this.followState === "unfollowed") {
      this.followState = "followed";
    } else {
      this.followState = "unfollowed";
    }

    this.el.text(this.render());
  }
}

module.exports = FollowToggle;
