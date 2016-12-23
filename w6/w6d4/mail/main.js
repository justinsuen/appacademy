const Router = require('./router.js');

document.addEventListener('DOMContentLoaded', () => {
  let contentNode = document.querySelector(".content");
  let router = new Router(contentNode);
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
