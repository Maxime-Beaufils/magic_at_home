class GamesController < ApplicationController
  def index
    @game = Game.new
    if params[:search].present?
      @games_city = Game.near(params[:search], 150).page(params[:page]).per(10)
      @games = Game.first.nearbys(150).page(params[:page]).per(10)
    #@games = Game.all.page(params[:page]).per(10)
    else
    #nerbys(n) n=distance en km
    @games = Game.first.nearbys(150).page(params[:page]).per(10)
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
                      'longitude' => results.first.coordinates.last)
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
