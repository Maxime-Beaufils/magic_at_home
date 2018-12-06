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
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to(member_profile_path(@profile), :notice => 'Your profile was successfully updated.') }
     else
       format.html { render :action => "edit" }
      end
    end
  end

  def show
  end
end
