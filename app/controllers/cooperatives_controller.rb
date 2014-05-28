# encoding: UTF-8
class CooperativesController < ApplicationController
  before_action :set_cooperative, only: [:show, :edit, :update, :destroy]

  # GET /cooperatives
  # GET /cooperatives.json
  def index
    @cooperatives = Cooperative.all
  end

  # GET /cooperatives/1
  # GET /cooperatives/1.json
  def show
  end

  # GET /cooperatives/new
  def new
    @cooperative = Cooperative.new
  end

  # GET /cooperatives/1/edit
  def edit
  end

  # POST /cooperatives
  # POST /cooperatives.json
  def create
    @cooperative = Cooperative.new(cooperative_params)

    respond_to do |format|
      if @cooperative.save
        format.html { redirect_to @cooperative, notice: 'تعاونی جدید ثبت شد.' }
        format.json { render action: 'show', status: :created, location: @cooperative }
      else
        format.html { render action: 'new' }
        format.json { render json: @cooperative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cooperatives/1
  # PATCH/PUT /cooperatives/1.json
  def update
    respond_to do |format|
      if @cooperative.update(cooperative_params)
        format.html { redirect_to @cooperative, notice: 'ویرایش اطلاعات انجام شد.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cooperative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cooperatives/1
  # DELETE /cooperatives/1.json
  def destroy
    @cooperative.destroy
    respond_to do |format|
      format.html { redirect_to cooperatives_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cooperative
      @cooperative = Cooperative.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cooperative_params
      params.require(:cooperative).permit(:name, :managment_name, :board_Chairman_name, :address, :phone, :website)
    end
end
