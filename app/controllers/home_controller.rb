class HomeController < ApplicationController

  def index
    #binding.pry
    @memes = Meme.where(:category => {:name => "news"}).paginate(page: params[:page], per_page: 15).order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end

end