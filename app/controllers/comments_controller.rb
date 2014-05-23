class CommentsController < ApplicationController
  def create
    @meme = Meme.find(params[:meme_id])
    @comment = @meme.comments.create!(comment: params[:comment][:comment])
    @comment.user = current_user
    if @comment.save
      redirect_to @meme
    end
  end

  def update
    @meme = Meme.find(params[:meme_id])
    @comment = @meme.comments.find(params[:id])
    if @comment.update(comment: params[:comment][:comment])
      redirect_to @meme
    end
  end

  def destroy
    @meme = Meme.find(params[:meme_id])
    @comment = @meme.comments.find(params[:id])
    if @comment.destroy
      redirect_to @meme
    end
  end
end