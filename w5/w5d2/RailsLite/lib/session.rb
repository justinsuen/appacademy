require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    cookie = req.cookies["_rails_lite_app"]

    if cookie
      @cookie_hash = JSON.parse(cookie)
    else
      @cookie_hash = {}
    end
  end

  def [](key)
    @cookie_hash[key]
  end

  def []=(key, val)
    @cookie_hash[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    cookie = { path: "/", value: @cookie_hash.to_json }
    res.set_cookie("_rails_lite_app", cookie)
  end
end
