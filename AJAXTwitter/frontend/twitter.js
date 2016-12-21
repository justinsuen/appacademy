const FollowToggle = require('./follow_toggle.js');

$(document).ready(function (){
  const $buttons = $("button");
  for (let i = 0; i < $buttons.length; i++) {
    const followToggle = new FollowToggle($buttons[i]);
  }
});
