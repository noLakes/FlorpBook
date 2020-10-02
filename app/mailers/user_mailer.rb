class UserMailer < ApplicationMailer
  default from: 'info@florp.net'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to FlorpNet!')
  end
end
