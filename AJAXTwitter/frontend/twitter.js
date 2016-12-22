const FollowToggle = require('./follow_toggle.js');
const UsersSearch = require('./users_search.js');

$(document).ready(function (){
  const $buttons = $("button");
  for (let i = 0; i < $buttons.length; i++) {
    const followToggle = new FollowToggle($buttons[i]);
  }

  const $usersSearch = $(".users-search")[0];
  const userSearchForm = new UsersSearch($usersSearch);
});
