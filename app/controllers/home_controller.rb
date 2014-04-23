class HomeController < ApplicationController

  def index
    category = params[:tag]
    if category === 'featured'
      @memes = Meme.where("featured = ?", true).paginate(page: params[:page], per_page: 15).order('created_at DESC')
    else
      @memes = Meme.joins(:categories).where("name like ?", category).paginate(page: params[:page], per_page: 15).order('created_at DESC')
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

end