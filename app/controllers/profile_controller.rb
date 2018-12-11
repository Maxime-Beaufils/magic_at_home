class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @profiles = Profile.all
    @cup = current_user.profile
    if params[:search].present?
      @games_city = Game.near(params[:search], 150).page(params[:page]).per(10)
      @games = Game.all.near([@cup.latitude,@cup.longitude], 150).page(params[:page]).per(10)
    else
    #nerbys(n) n=distance en km
    @games = Game.all.near([@cup.latitude,@cup.longitude], 150).page(params[:page]).per(10)
    end
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
        format.html { redirect_to '/profil', :notice => 'Votre profil a été mis a jour.' }
     else
       format.html { render :action => "edit" }
      end
    end
  end

  def show
  end

private

  def profile_params
    params.require(:profile).permit(:username, :country, :city, :zip, :street, :longitude, :latitude, :favorite_format,
                                    :favorite_color, :bio)
  end
end
