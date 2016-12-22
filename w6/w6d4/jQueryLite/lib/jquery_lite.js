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

	const DOMNodeCollection = __webpack_require__(2);

	// $l(HTMLElement) - selects the element in arg given a CSS selector
	window.$l = arg => {
	  let argsList;
	  if (arg instanceof HTMLElement) {
	    argsList = [arg];
	  } else {
	    let nodeList = document.querySelectorAll(arg);
	    argsList = Array.from(nodeList);
	  }

	  return new DOMNodeCollection(argsList);
	};


/***/ },
/* 1 */,
/* 2 */
/***/ function(module, exports) {

	class DOMNodeCollection {
	  constructor(nodes) {
	    this.nodes = nodes;
	  }

	  each (cb) {
	    for (let i = 0; i < this.nodes.length; i++) {
	      cb(this.nodes[i]);
	    }
	  }

	  html(html) {
	    if (typeof html === 'string') {
	      this.each(node => { node.innerHTML = html; });
	    } else {
	      if (this.nodes.length > 0) {
	        return this.nodes[0].innerHTML;
	      }
	    }
	  }

	  empty() {
	    this.html('');
	  }

	  append(content) {
	    if (this.nodes.length === 0) {
	      return;
	    }

	    if ((typeof content === 'object') &&
	      !(content instanceof DOMNodeCollection)) {
	      content = $(content);
	    }

	    if (typeof content === 'string') {
	      this.each(node => { node.innerHTML += content; });
	    } else if (content instanceof DOMNodeCollection) {
	      this.each(node => {
	        content.each(childNode => {
	          node.appendChild(childNode.cloneNode(true));
	        });
	      });
	    }
	  }

	  attr(key, val) {
	    if (typeof val === 'string' || typeof val === 'number') {
	      this.each(node => node.setAttribute(key, val));
	    } else {
	      return this.nodes[0].getAttribute(key);
	    }
	  }

	  addClass(className) {
	    this.each(node => node.classList.append(className));
	  }

	  removeClass(className) {
	    this.each(node => node.classList.remove(className));
	  }

	  children() {
	    let childNodes = [];
	    this.each(node => {
	      childNodes = childNodes.concat(Array.from(node.childNodes));
	    });
	    return new DOMNodeCollection(childNodes);
	  }

	  parent() {
	    let parentNodes = [];
	    this.each(node => parentNodes.push(node.parentNode));
	    return new DOMNodeCollection(parentNodes);
	  }

	  find(selector) {
	    let foundNodes = [];
	    this.each(node => {
	      let nodeList = node.querySelectorAll(selector);
	      foundNodes = foundNodes.concat(Array.from(nodeList));
	    });
	    return new DOMNodeCollection(foundNodes);
	  }

	  remove() {
	    this.each(node => node.parentNode.removeChild(node));
	  }
	}

	module.exports = DOMNodeCollection;


/***/ }
/******/ ]);