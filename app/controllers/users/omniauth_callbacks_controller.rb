class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  params[:auth] = request.env["omniauth.auth"]
  params[:params] = request.env["omniauth.params"]
  def facebook
    
    user = User.from_omniauth(request.env["omniauth.auth"], request.env["omniauth.params"])
    
    if user.persisted?
    #create profile when user create
    Profile.create!(user_id: resource.id)
      flash.notice = "Signed in!"
      sign_in_and_redirect(user) and return
    else
   
      user.save
      flash.notice = "Created account!"
      sign_in_and_redirect(user) and return
    end
  end

 end

