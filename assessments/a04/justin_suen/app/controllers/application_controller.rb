class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def login_user(user)
    @current_user = user
    session[:session_token] = @current_user.reset_session_token!
  end

  def logout_user
    current_user.reset_session_token!
    @current_user = nil
    session[:session_token] = nil
  end

  private

  def require_user_login!
    redirect_to new_session_url unless logged_in?
  end
end
