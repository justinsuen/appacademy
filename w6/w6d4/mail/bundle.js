/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const Router = __webpack_require__(1);
	const Inbox = __webpack_require__(2);
	const Sent = __webpack_require__(4);
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


/***/ },
/* 1 */
/***/ function(module, exports) {

	class Router {
	  constructor(node, routes) {
	    this.node = node;
	    this.routes = routes;
	  }

	  start() {
	    this.render();
	    window.addEventListener('hashchange', () => {
	      this.render();
	    });
	  }

	  render() {
	    let component = this.activeRoute();
	    this.node.innerHTML = '';
	    if (component) {
	      this.node.appendChild(component.render());
	    }
	  }

	  activeRoute() {
	    let hash = window.location.hash.replace(/#/, '');
	    return this.routes[hash];
	  }
	}

	module.exports = Router;


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	const MessageStore = __webpack_require__(3);

	module.exports = {
	  render() {
	    let ul = document.createElement('ul');
	    ul.className = 'messages';

	    let messages = MessageStore.getInboxMessages();
	    messages.forEach((msg) => {
	      ul.appendChild(this.renderMessage(msg));
	    });

	    return ul;
	  },

	  renderMessage(message) {
	    let li = document.createElement('li');
	    li.className = 'message';

	    li.innerHTML = `
	    <span class='from'>${message.from}</span>
	    <span class="subject">${message.subject}</span> -
	    <span class="body">${message.body}</span>
	    `;

	    return li;
	  }
	};


/***/ },
/* 3 */
/***/ function(module, exports) {

	let messages = {
	  sent: [{
	    to: "friend@mail.com",
	    subject: "Check this out",
	    body: "It's so cool."
	  }, {
	    to: "person@mail.com",
	    subject: "App Academy is cool",
	    body: "NOT!"
	  }],
	  inbox: [{
	    from: "grandma@mail.com",
	    subject: "Fwd: Fwd: Fwd: Check this out",
	    body: "Stay at home mom discovers cure for leg cramps. Doctors hate her."
	  }, {
	    from: "person@mail.com",
	    subject: "Questionnaire",
	    body: "Take this free quiz win $1000 dollars!"
	  }]
	};

	const MessageStore = {
	  getInboxMessages() {
	    return messages.inbox.slice();
	  },

	  getSentMessages() {
	    return messages.sent.slice();
	  }
	};

	module.exports = MessageStore;


/***/ },
/* 4 */
/***/ function(module, exports, __webpack_require__) {

	const MessageStore = __webpack_require__(3);

	module.exports = {
	  render() {
	    let ul = document.createElement('ul');
	    ul.className = 'messages';

	    let messages = MessageStore.getSentMessages();
	    messages.forEach((msg) => {
	      ul.appendChild(this.renderMessage(msg));
	    });

	    return ul;
	  },

	  renderMessage(message) {
	    let li = document.createElement('li');
	    li.className = 'message';

	    li.innerHTML = `
	    <span class='to'>To: ${message.to}</span>
	    <span class="subject">${message.subject}</span> -
	    <span class="body">${message.body}</span>
	    `;

	    return li;
	  }
	};


/***/ }
/******/ ]);