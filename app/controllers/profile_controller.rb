class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @profiles = Profile.all
    @cup = current_user.profile
    if params[:search].present?
      @player_city = Profile.near(params[:search], 150).page(params[:page]).per(10)
      @player = Profile.all.near([@cup.latitude,@cup.longitude], 150).page(params[:page]).per(10)
    else
    #nerbys(n) n=distance en km
    @player = Profile.all.near([@cup.latitude,@cup.longitude], 150).page(params[:page]).per(10)
    end
  end

  def edit
    @user = current_user
    @profile = @user.profile
    @games = Game.where("date >= ?", Time.current).order('date ASC')
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
    @user = User.find(params[:id])
    @games = Game.all.where("date >= ?", Time.current).page(params[:page]).per(10)
  end

private

  def profile_params
    params.require(:profile).permit(:username, :country, :city, :zip, :street, :longitude, :latitude, :favorite_format,
                                    :favorite_color, :bio)
  end
end
