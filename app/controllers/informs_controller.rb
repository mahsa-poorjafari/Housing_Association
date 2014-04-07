# encoding: UTF-8
class InformsController < ApplicationController
  before_action :set_inform, only: [:show, :edit, :update, :destroy]

  # GET /informs
  # GET /informs.json
  def index
    @informs = Inform.all
  end

  # GET /informs/1
  # GET /informs/1.json
  def show
  end

  # GET /informs/new
  def new
    @inform = Inform.new
  end

  # GET /informs/1/edit
  def edit
  end

  # POST /informs
  # POST /informs.json
  def create
    @inform = Inform.new(inform_params)

    respond_to do |format|
      if @inform.save
        format.html { redirect_to @inform, notice: 'خبر جدید ثبت شد.' }
        format.json { render action: 'show', status: :created, location: @inform }
      else
        format.html { render action: 'new' }
        format.json { render json: @inform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /informs/1
  # PATCH/PUT /informs/1.json
  def update
    respond_to do |format|
      if @inform.update(inform_params)
        format.html { redirect_to @inform, notice: 'ویرایش خبر انجام شد.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @inform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /informs/1
  # DELETE /informs/1.json
  def destroy
    @inform.destroy
    respond_to do |format|
      format.html { redirect_to informs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inform
      @inform = Inform.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inform_params
      params.require(:inform).permit(:title, :text, :number_visit, :important, :image)
    end
end
