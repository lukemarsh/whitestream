class MemesController < ApplicationController
  before_action :set_meme, only: [:show, :edit, :update, :destroy]
  impressionist :actions=>[:show]

  # GET /memes
  # GET /memes.json
  def index
    @body_id = "home"
    @meme_categories = Category.all
    filter = params[:filter]
    @sort = params[:sort]

    if filter
      @meme_count = Meme.where("featured != ?", true).joins(:categories).filter(filter).length
    else
      @meme_count = Meme.where("featured != ?", true).sort(@sort).length
    end

    @memes = Meme.where("featured != ?", true).paginate(page: params[:page], per_page: 8).filter(filter).sort(@sort).order('created_at DESC')
    @featured = Meme.where("featured = ?", true)
    render :layout => 'home'
  end

  # GET /memes/1
  # GET /memes/1.json
  def show
    @body_id = "show"
    impressionist(@meme)
    @meme = Meme.find(params[:id])
    @comment = @meme.comments.new
    @comments = @meme.comments.recent.limit(10).all
    if @meme.imgur_url
      @imgur_image = @meme.imgur_url.gsub("http://", "http://i.") + ".png"
    end
    @memes = Meme.where('user_id = ?', @meme.user).where('id != ?', @meme.id).order('created_at DESC').limit(2)
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
    unless @meme.user && @meme.user == current_user || current_admin
      redirect_to root_url
    end
    @raw_image = @meme.raw_image
    @top_line = @meme.top_line
    @bottom_line = @meme.bottom_line
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

    @meme = Meme.create!(image: params[:image], imgur_url: params[:imgur_url], deletehash: params[:deletehash], colour: params[:colour], copied_image: params[:copied_image], raw_image: params[:raw_image], top_line: params[:top_line], bottom_line: params[:bottom_line], article: params[:article], category_ids: params[:category_ids].split(','))
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
    if params[:image].try(:original_filename) == 'blob'
      params[:image].original_filename << '.png'
    end
    if params[:raw_image].try(:original_filename) == 'blob'
      params[:raw_image].original_filename << '.png'
    end

    @meme = Meme.find(params[:id])
    @meme.user = current_user

    respond_to do |format|
      if @meme.update_attributes(image: params[:image], imgur_url: params[:imgur_url], deletehash: params[:deletehash], colour: params[:colour], copied_image: params[:copied_image], raw_image: params[:raw_image], top_line: params[:top_line], bottom_line: params[:bottom_line], article: params[:article], category_ids: params[:category_ids].split(','))
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

  def feature
    @meme = Meme.find(params[:meme_id])
    if @meme.update(featured: true)
      redirect_to memes_url
    end
  end

  def unfeature
    @meme = Meme.find(params[:meme_id])
    @meme.update(featured: false)
    redirect_to memes_url
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
