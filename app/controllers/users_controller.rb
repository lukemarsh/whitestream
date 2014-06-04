class UsersController < ApplicationController
  def show
    @body_id = "show"
    @meme_categories = Category.all
    @user = User.find_by_username(params[:username])
    @username = @user.username
    filter = params[:filter]
    @sort = params[:sort]

    if filter
      @meme_count = Meme.where('user_id = ?', @user).joins(:categories).filter(filter).length
    else
      @meme_count = Meme.where('user_id = ?', @user).sort(@sort).length
    end
    @memes = Meme.where('user_id = ?', @user).paginate(page: params[:page], per_page: 8).filter(filter).sort(@sort).order('created_at DESC')
    render :layout => 'user-show'
  end

  def profile
    @user = User.find_by_username(params[:username])
  end
end