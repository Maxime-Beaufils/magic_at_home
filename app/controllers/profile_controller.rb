class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
   
  end

  def edit
    @user = current_user
    @profile = @user.profile
  end

  def update
    @user = current_user
    @profile = @user.profile
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to(edit_profile_path(@profile), :notice => 'Votre profil a été mis a jour.') }
     else
       format.html { render :action => "edit" }
      end
    end
  end

  def show
  end

private

  def profile_params
    params.require(:profile).permit(:username, :country, :city, :zip, :street, :favorite_format,
                                    :favorite_color, :bio)
  end
end
