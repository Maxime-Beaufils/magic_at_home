class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def profil
    @user = current_user
  end
  
  def map
  end
end
