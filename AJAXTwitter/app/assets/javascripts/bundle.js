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
	const UsersSearch = __webpack_require__(3);
	
	$(document).ready(function (){
	  const $buttons = $("button");
	  for (let i = 0; i < $buttons.length; i++) {
	    const followToggle = new FollowToggle($buttons[i]);
	  }
	
	  const $usersSearch = $(".users-search")[0];
	  const userSearchForm = new UsersSearch($usersSearch);
	});


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	const APIUtil = __webpack_require__(2);
	
	class FollowToggle {
	  constructor(el, options) {
	    this.el = $(el);
	    this.userId = this.el.data("user-id") || options.userId;
	    this.followState = this.el.data("initial-follow-state") || options.followState;
	
	    this.render();
	    this.handleClick();
	  }
	
	  render() {
	    if (this.followState === "unfollowed") {
	      this.el.text("Follow!");
	      this.el.prop("disabled", false);
	    } else if (this.followState === "followed") {
	      this.el.text("Unfollow!");
	      this.el.prop("disabled", false);
	    } else if (this.followState === "unfollowing") {
	      this.el.text("Unfollowing...");
	      this.followState = "unfollowed";
	      this.el.prop("disabled", true);
	    } else if (this.followState === "following"){
	      this.el.text("Following...");
	      this.followState = "followed";
	      this.el.prop("disabled", true);
	    }
	  }
	
	  handleClick() {
	    $(this.el).on("click", event => {
	      event.preventDefault();
	
	      if (this.followState === "unfollowed"){
	        this.followState = "following";
	        this.render();
	        APIUtil.followUser(this.userId).then(this.render.bind(this));
	      } else {
	        this.followState = "unfollowing";
	        this.render();
	        APIUtil.unfollowUser(this.userId).then(this.render.bind(this));
	      }
	    });
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
	  },
	
	  searchUsers: (query) => {
	    return $.ajax({
	      method: "GET",
	      url: "/users/search",
	      data: { query },
	      dataType: "json",
	    });
	  }
	};
	
	module.exports = APIUtil;


/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	const APIUtil = __webpack_require__(2);
	const FollowToggle = __webpack_require__(1);
	
	class UsersSearch {
	  constructor(el) {
	    this.$el = $(el);
	    this.$ul = this.$el.find("ul.users");
	    this.$input = this.$el.find("input");
	    this.$input.on("input", () => this.handleInput());
	  }
	
	  handleInput() {
	    APIUtil.searchUsers(this.$input.val())
	      .then(users => {
	        this.renderUsers(users);
	      });
	  }
	
	  renderUsers(users) {
	    // debugger;
	    this.$ul.empty();
	    for (let i = 0; i < users.length; i++) {
	      let button = '<button class="follow-toggle" type="button"></button>';
	      let $li = $(`<li>${users[i].username} ${button}</li>`);
	      this.$ul.append($li);
	    }
	
	    const $buttons = $(".follow-toggle");
	    for (let j = 0; j < $buttons.length; j++) {
	      let $button = $buttons[j];
	      let followState = users[j].followed ? "followed" : "unfollowed";
	      const followToggle = new FollowToggle($button, {userId: users[j].id, followState: followState});
	    }
	  }
	}
	
	module.exports = UsersSearch;


/***/ }
/******/ ]);
//# sourceMappingURL=bundle.js.map