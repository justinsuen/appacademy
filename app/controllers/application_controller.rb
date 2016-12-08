class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    # fail
    User.find_by_session_token(session[:session_token])
  end

  def login_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  private

  def already_signed_in
    redirect_to cats_url if current_user
  end
end
