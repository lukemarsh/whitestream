class UsersController < ApplicationController
  before_action :set_user, :finish_signup

  def show
    @body_id = "show"
    @meme_categories = Category.all
    @user_username = params[:username]
    @user_id = params[:id]
    @user = @user_username ? User.find_by_username(@user_username) : User.find_by_id(@user_id)
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

  def finish_signup
    if request.patch? && params[:user] #&& params[:user][:email]
      if current_user.update(user_params)
        sign_in(current_user, :bypass => true)
        redirect_to username_path(current_user.username), notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  private
    def set_user
      @user = User.find_by_username(params[:username])
    end

    def user_params
      accessible = [ :name, :email, :username, :auth_profile_picture ] # extend with your own params
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end
end