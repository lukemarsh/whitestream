class HomeController < ApplicationController
  def index
    @memes = Meme.where("featured = ?", true).paginate(page: params[:page], per_page: 15).order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end

end