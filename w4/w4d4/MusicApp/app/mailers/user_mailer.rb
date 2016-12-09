class UserMailer < ApplicationMailer
  default from: 'justin@suen.com'

  def activation_email(user)
    @user = user
    @url = activation_users_url(activation: @user.activation_token)
    mail(to: user.email, subject: 'Welcome to my Music App!')
  end
end
