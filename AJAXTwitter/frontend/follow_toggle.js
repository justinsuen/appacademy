const APIUtil = require("./api_util.js");

class FollowToggle {
  constructor(el) {
    this.el = $(el);
    this.userId = this.el.data("user-id");
    this.followState = this.el.data("initial-follow-state");

    this.render();
    this.handleClick();
  }

  render() {
    if (this.followState === "unfollowed") {
      this.el.text("Follow!");
      this.el.prop("disabled", false);
    } else if (this.followState === "followed") {
      this.el.text("Unfollow!");
      this.el.prop("disabled", false);
    } else if (this.followState === "unfollowing") {
      this.el.text("Unfollowing...");
      this.followState = "unfollowed";
      this.el.prop("disabled", true);
    } else if (this.followState === "following"){
      this.el.text("Following...");
      this.followState = "followed";
      this.el.prop("disabled", true);
    }
  }

  handleClick() {
    $(this.el).on("click", event => {
      event.preventDefault();

      if (this.followState === "unfollowed"){
        this.followState = "following";
        this.render();
        APIUtil.followUser(this.userId).then(this.render.bind(this));
      } else {
        this.followState = "unfollowing";
        this.render();
        APIUtil.unfollowUser(this.userId).then(this.render.bind(this));
      }
    });
  }
}

module.exports = FollowToggle;
