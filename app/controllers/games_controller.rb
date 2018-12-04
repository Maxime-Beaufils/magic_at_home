class GamesController < ApplicationController
  def index
    @games = Game.all.page(params[:page]).per(20)
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create('place' => params.require(:game)[:place],
                      'date' => params.require(:game)[:date],
                      'description' => params.require(:game)[:description],
                      'game_format' => params.require(:game)[:game_format])
                      #'user_creator_id' => User.find_by(name: "#{$curent_user}").id)
  
    redirect_to games_path
  end
  
  def show
  end

  def edit
  end

  def update
  end


  def delete
  end

  def destroy
  end

 
end
