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


/***/ },
/* 1 */
/***/ function(module, exports) {

	class Router {
	  constructor(node) {
	    this.node = node;
	  }

	  start() {
	    this.render();
	    window.addEventListener('hashchange', () => {
	      this.render();
	    });
	  }

	  render() {
	    this.node.innerHTML = '';
	    let route = this.activeRoute();
	    let p = document.createElement('p');
	    p.innerHTML = route;
	    this.node.appendChild(p);
	  }

	  activeRoute() {
	    return window.location.hash.replace(/#/, '');
	  }
	}

	module.exports = Router;


/***/ }
/******/ ]);