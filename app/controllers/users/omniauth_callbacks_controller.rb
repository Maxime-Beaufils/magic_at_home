class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    puts "1"
    user = User.from_omniauth(request.env["omniauth.auth"], request.env["omniauth.params"])
    puts "2"
    if user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect(user) and return
    else
    puts "3"
      user.save
      flash.notice = "Created account!"
      sign_in_and_redirect(user) and return
    end
  end

 end