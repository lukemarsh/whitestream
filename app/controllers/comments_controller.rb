class CommentsController < ApplicationController
  def create
    @meme = Meme.find(params[:meme_id])
    @comment = @meme.comments.create!(comment: params[:comment][:comment])
    @comment.user = current_user
    if @comment.save
      redirect_to @meme
    end
  end
end