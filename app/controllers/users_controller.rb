class UsersController < ApplicationController
  # POST /users
  # POST /users.json


  def send_order_mail(user)
    @user = user
    @url  = 'http://localhost:3000/users/sign_in'
    mail to: user.email, subject: 'Welcome to My Awesome Site'
  end
  
  def send_order_mail
    @user = User.find(params[:id])
    UserMailer.send_order_mail(@user).deliver_now
    flash[:notice]= "Email has been sent successfully!"
    redirect_to projects_path
  end
end