const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search.js');
const TweetCompose = require('./tweet_compose.js');

$(document).ready(function (){
  const $buttons = $("button");
  for (let i = 0; i < $buttons.length; i++) {
    const followToggle = new FollowToggle($buttons[i]);
  }

  const $usersSearch = $(".users-search")[0];
  const userSearchForm = new UsersSearch($usersSearch);

  const $tweetCompose = $("form.tweet-compose");
  const tweetForm = new TweetCompose($tweetCompose);
});
