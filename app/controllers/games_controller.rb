class GamesController < ApplicationController
  def index
    @game = Game.new
    @games = Game.all.page(params[:page]).per(10)
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
    @game = Game.find(params[:id])
    @id= params[:id]
  end

  def edit
    @game = Game.find(params[:id])
    @id= params[:id]
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    redirect_to game_path(@game.id)
  end


  def delete
  end

  def destroy
  end
private
  def game_params
    params.require(:game).permit(:date, :place, :game_format, :description)
  end
 
end
