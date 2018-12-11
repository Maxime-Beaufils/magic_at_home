class GamesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @game = Game.new
    @cup = current_user.profile
    if params[:search].present?
      @games_city = Game.near(params[:search], 150).page(params[:page]).per(10)
      @games = Game.all.near([@cup.latitude,@cup.longitude], 150).page(params[:page]).per(10)
    else
    #nerbys(n) n=distance en km
    @games = Game.all.near([@cup.latitude,@cup.longitude], 150).page(params[:page]).per(10)
    end
  end

  def new
    @game = Game.new
  end

  def create
    results = Geocoder.search(params.require(:game)[:place])
    @game = Game.create('place' => params.require(:game)[:place],
                      'date' => params.require(:game)[:date],
                      'description' => params.require(:game)[:description],
                      'game_format' => params.require(:game)[:game_format],
                      'latitude' => results.first.coordinates.first,
                      'longitude' => results.first.coordinates.last,
                      'user_creator_id' => current_user.id)
  
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
    redirect_to game_path(@game.id), :notice => 'Partie modifiée avec succés.'
  end

  def join_game
    @game = Game.find(params[:id])
    if @game.user_opponent_id == current_user.id
        @game.update(user_opponent_id: nil)
        redirect_to game_path(@game.id), :notice => 'Vous avez quitté la partie.'
    else
        @game.update(user_opponent_id: current_user.id)
        redirect_to game_path(@game.id), :notice => 'Vous avez rejoins la partie.'
    end
  end

  def delete
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to '/games'
  end
private
  def game_params
    params.require(:game).permit(:date, :place, :game_format, :description, :user_opponent_id)
  end
  
end
