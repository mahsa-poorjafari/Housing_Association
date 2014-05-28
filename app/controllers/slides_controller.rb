# encoding: UTF-8
class SlidesController < ApplicationController
  impressionist :actions=>[:show,:index]
  before_action :set_slide, only: [:show, :edit, :update, :destroy]
  # before_filter :check_autentication
  # GET /slides
  # GET /slides.json
  def index
    @slides = Slide.all
  end

  # GET /slides/1
  # GET /slides/1.json
  def show
  end

  # GET /slides/new
  def new
    @slide = Slide.new
  end

  # GET /slides/1/edit
  def edit
  end

  # POST /slides
  # POST /slides.json
  def create
    @slide = Slide.new(slide_params)

    respond_to do |format|
      if @slide.save
        format.html { redirect_to edit_slide_path(@slide), notice: 'عکس جدید در اسلایدر اضافه شد'}
        format.json { render action: 'show', status: :created, location: @slide }
      else
        format.html { render action: 'new' }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slides/1
  # PATCH/PUT /slides/1.json
  def update
    respond_to do |format|
      if @slide.update(slide_params)
        @slide.image.reprocess!
        format.html { redirect_to @slide, notice: 'Slide was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slides/1
  # DELETE /slides/1.json
  def destroy
    @slide.destroy
    respond_to do |format|
      format.html { redirect_to slides_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slide
      @slide = Slide.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slide_params
      params.require(:slide).permit(:description, :image, :crop_x, :crop_y, :crop_w, :crop_h)
    end
end
