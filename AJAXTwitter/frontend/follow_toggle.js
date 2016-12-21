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

      let resType = "";
      if (this.followState === "unfollowed"){
        resType = "POST";
      } else {
        resType = "DELETE";
      }

      let that = this;
      $.ajax({
        method: resType,
        url: `/users/${this.userId}/follow`,
        dataType: "json",
        success(){
          that.switchFollowState();
          that.el.text(that.render());
        }
      });
    });
  }

  switchFollowState() {
    if (this.followState === "unfollowed") {
      this.followState = "followed";
    } else {
      this.followState = "unfollowed";
    }
  }
}

module.exports = FollowToggle;
