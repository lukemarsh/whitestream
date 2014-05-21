class MemesController < ApplicationController
  before_filter :authenticate_user!, only: [:new]
  before_action :set_meme, only: [:show, :edit, :update, :destroy]
  impressionist :actions=>[:show]

  # GET /memes
  # GET /memes.json
  def index
    @body_id = "home"
    @memes = Meme.where("featured != ?", true).paginate(page: params[:page], per_page: 15).order('created_at DESC')
    @featured = Meme.where("featured = ?", true).paginate(page: params[:page], per_page: 4).order('created_at DESC')
  end

  def show_all
    @memes = Meme.where("featured != ?", true).paginate(page: params[:page], per_page: 12).order('created_at DESC')
  end

  def from_popular
    @memes = Meme.where("featured != ?", true).plusminus_tally({:order => "vote_count DESC"}).paginate(page: params[:page], per_page: 12)
  end

  def from_category
    @memes = Meme.joins(:categories).where("featured != ?", true).where("name like ?", params[:category]).paginate(page: params[:page], per_page: 15).order('created_at DESC')
  end

  # GET /memes/1
  # GET /memes/1.json
  def show
    impressionist(@meme)
    @meme = Meme.find(params[:id])
    @comment = @meme.comments.new
    @comments = @meme.comments.recent.limit(10).all
    @memes = Meme.where('user_id = ?', @meme.user).paginate(page: params[:page], per_page: 12).order('created_at DESC')
  end

  # GET /memes/new
  def new
    @meme = Meme.new
    @raw_image = params[:raw_image]
    @top_line = params[:top_line]
    @bottom_line = params[:bottom_line]
  end

  # GET /memes/1/edit
  def edit
    @meme = Meme.find(params[:id])
    @raw_image = "/uploads/meme/raw_image/#{@meme.id}/blob.png"
  end

  # POST /memes
  # POST /memes.json
  def create
    if params[:image].try(:original_filename) == 'blob'
      params[:image].original_filename << '.png'
    end
    if params[:raw_image].try(:original_filename) == 'blob'
      params[:raw_image].original_filename << '.png'
    end

    @meme = Meme.create!(image: params[:image], copied_image: params[:copied_image], raw_image: params[:raw_image], top_line: params[:top_line], bottom_line: params[:bottom_line], article: params[:article], category_ids: params[:category_ids].split(','))
    @meme.user = current_user

    respond_to do |format|
      if @meme.save
        format.html { redirect_to @meme, notice: 'Meme was successfully created.' }
        format.json { render action: 'show', status: :created, location: @meme }
      else
        format.html { render action: 'new' }
        format.json { render json: @meme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memes/1
  # PATCH/PUT /memes/1.json
  def update
    respond_to do |format|
      if @meme.update(meme_params)
        format.html { redirect_to @meme, notice: 'Meme was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @meme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memes/1
  # DELETE /memes/1.json
  def destroy
    @meme.destroy
    respond_to do |format|
      format.html { redirect_to memes_url }
      format.json { head :no_content }
    end
  end

  def vote_for_meme
    @meme = Meme.find(params[:meme_id])
    current_user.vote_for(@meme)
  end

  def vote_against_meme
    @meme = Meme.find(params[:meme_id])
    current_user.unvote_for(@meme)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meme
      @meme = Meme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meme_params
      params.require(:meme).permit(:featured, :published) if params[:meme]
    end
end
