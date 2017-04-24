class UserMailer < ApplicationMailer
  default from: 'example@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/users/sign_in'
    mail to: user.email, subject: 'Welcome to My Awesome Site'
  end

  def send_order_mail(user)
    @user = user
    #@url  = 'http://localhost:3000/users/sign_in'
    mail to: user.email, subject: 'Welcome to My Awesome Site'
  end
end
