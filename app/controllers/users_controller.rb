class UsersController < ApplicationController
  def show
    @body_id = "show"
    @user = User.find(params[:id])
    @username = @user.username
    @memes = Meme.where('user_id = ?', @user).paginate(page: params[:page], per_page: 12).order('created_at DESC')
    render :layout => 'user-show'
  end
end