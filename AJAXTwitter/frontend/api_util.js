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
