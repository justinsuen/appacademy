const Router = require('./router.js');
const Inbox = require('./inbox.js');
const Sent = require('./sent.js');
// const Router = require('./router.js');

let routes = {
  inbox: Inbox,
  // compose: Compose,
  sent: Sent
};

document.addEventListener('DOMContentLoaded', () => {
  let contentNode = document.querySelector(".content");
  let router = new Router(contentNode, routes);
  router.start();

  window.location.hash = '#index';
  let navItems = Array.from(document.querySelectorAll('.sidebar-nav li'));
  navItems.forEach(navItem => {
    navItem.addEventListener('click', () => {
      let name = navItem.innerText.toLowerCase();
      window.location.hash = name;
    });
  });
});
