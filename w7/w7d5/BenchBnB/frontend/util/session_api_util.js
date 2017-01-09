export const signup = user => {
  return(
    $.ajax({
      method: "POST",
      url: "api/user",
      data: user
    })
  );
};

export const signin = user => {
  return(
    $.ajax({
      method: "POST",
      url: "api/session",
      data: user
    })
  );
};

export const signout = () => {
  return(
    $.ajax({
      method: "DELETE",
      url: "api/session"
    })
  );
};
