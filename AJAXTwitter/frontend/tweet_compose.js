const APIUtil = require("./api_util.js");

class TweetCompose {
  constructor(el) {
    this.$el = $(el);
    this.$el.on("submit", (event) => this.submit(event));
  }

  submit(event) {
    event.preventDefault();

    let $data = this.$el.serializeJSON();
    this.$el.find("input").prop("disabled", "true");

    APIUtil.createTweet($data).then(this.handleSuccess);
  }

  handleSuccess() {

  }
}

module.exports = TweetCompose;
