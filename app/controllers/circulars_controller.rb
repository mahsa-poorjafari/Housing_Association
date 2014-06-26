# encoding: UTF-8
class CircularsController < ApplicationController
  before_action :set_circular, only: [:show, :edit, :update, :destroy]
  before_filter :check_autentication_complaint, only: [:edit, :update, :destroy]
  # GET /circulars
  # GET /circulars.json
  def index
    @circulars = Circular.order(" created_at desc")
  end

  # GET /circulars/1
  # GET /circulars/1.json
  def show
  end

  # GET /circulars/new
  def new
    @circular = Circular.new
  end

  # GET /circulars/1/edit
  def edit
  end

  # POST /circulars
  # POST /circulars.json
  def create
    @circular = Circular.new(circular_params)

    respond_to do |format|
      if @circular.save
        format.html { redirect_to @circular, notice: 'Circular was successfully created.' }
        format.json { render action: 'show', status: :created, location: @circular }
      else
        format.html { render action: 'new' }
        format.json { render json: @circular.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /circulars/1
  # PATCH/PUT /circulars/1.json
  def update
    respond_to do |format|
      if @circular.update(circular_params)
        format.html { redirect_to @circular, notice: 'Circular was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @circular.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /circulars/1
  # DELETE /circulars/1.json
  def destroy
    @circular.destroy
    respond_to do |format|
      format.html { redirect_to circulars_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circular
      @circular = Circular.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def circular_params
      params.require(:circular).permit(:title, :project_id, :description, :pdf)
    end
end
