class UserMailer < ApplicationMailer
  default from: 'justin@suen.com'

  def activation_email(user)
    @user = user
    mail(to: user.email, subject: 'Welcome to my Music App!')
  end
end
