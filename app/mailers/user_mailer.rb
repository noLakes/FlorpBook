class UserMailer < ApplicationMailer
  default from: 'info@florp.net'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to FlorpNet!')
  end
end
