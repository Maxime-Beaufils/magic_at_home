class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def facebook
    
    user = User.from_omniauth(request.env["omniauth.auth"], request.env["omniauth.params"])
    
    if user.persisted?
    #create profile when user create
    Profile.create!(user_id: user.id)
      flash.notice = "Signed in!"
      sign_in_and_redirect(user) and return
    else
   
      user.save
      flash.notice = "Created account!"
      sign_in_and_redirect(user) and return
    end
  end
def private
  params[:auth] = request.env["omniauth.auth"]
  params[:params] = request.env["omniauth.params"]
    end
end


