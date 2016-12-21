/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const FollowToggle = __webpack_require__(1);
	
	$(document).ready(function (){
	  const $buttons = $("button");
	  for (let i = 0; i < $buttons.length; i++) {
	    const followToggle = new FollowToggle($buttons[i]);
	  }
	});


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	const APIUtil = __webpack_require__(2);
	
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
	
	      if (this.followState === "unfollowed"){
	        APIUtil.followUser(this.userId)
	               .then(this.switchFollowState.bind(this));
	      } else {
	        APIUtil.unfollowUser(this.userId)
	               .then(this.switchFollowState.bind(this));
	      }
	    });
	  }
	
	  switchFollowState() {
	    if (this.followState === "unfollowed") {
	      this.followState = "followed";
	    } else {
	      this.followState = "unfollowed";
	    }
	
	    this.el.text(this.render());
	  }
	}
	
	module.exports = FollowToggle;


/***/ },
/* 2 */
/***/ function(module, exports) {

	const APIUtil = {
	  followUser: id => {
	    return $.ajax({
	      method: "POST",
	      url: `/users/${id}/follow`,
	      dataType: "json"
	    });
	  },
	
	  unfollowUser: id => {
	    return $.ajax({
	      method: "DELETE",
	      url: `/users/${id}/follow`,
	      dataType: "json"
	    });
	  }
	};
	
	module.exports = APIUtil;


/***/ }
/******/ ]);
//# sourceMappingURL=bundle.js.map