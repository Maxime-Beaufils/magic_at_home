class GameCommentsController < ApplicationController
  def new
    @comments = GameComment.new
  end
  def create
    @game = Game.find(params[:game_id])
    @comments = @game.game_comments.create(comment_params)
    redirect_to game_path(@game)
  end

  def show
  end 

  def edit
    @comment = GameComment.find(params[:game_id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    @comment = Comment.find(params[:gossip_id])
    @comment.update(comment_params)
    redirect_to @game
  end
  def delete
  end

  def destroy
  end
 
  private
    def comment_params
      params.require(:game_comment).permit(:username, :body)
    end

end
