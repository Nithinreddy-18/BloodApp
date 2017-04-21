class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth_github(request.env["omniauth.auth"])
    sign_in_and_redirect @user 

  end

  def change_mymail?

  end

  def google_oauth2
    @user = User.from_omniauth_google(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end
end              