# encoding: UTF-8
class PartnershipsController < ApplicationController
  before_action :set_partnership, only: [:show, :edit, :update, :destroy]

  # GET /partnerships
  # GET /partnerships.json
  def index
    @partnerships = Partnership.all
  end

  # GET /partnerships/1
  # GET /partnerships/1.json
  def show
  end
  
  def search_by_email
    email = params[:email]   
    if email
      @find_email = Partnership.search(email)
    end 
  end

  # GET /partnerships/new
  def new
    @partnership = Partnership.new
    @project_id = params[:project_id]
  end

  # GET /partnerships/1/edit
  def edit
  end

  # POST /partnerships
  # POST /partnerships.json
  def create
    @partnership = Partnership.new(partnership_params)    
    p '----------------'
    @project_id = params[:project_id]
    
    if @partnership.save     
      redirect_to new_pay_limit_path(:partnership_id => @partnership.id, :project_id => @project_id)
      flash[:reg]= 'اطلاعات شخصی شما ثبت شد' 
    else
      render action: 'new'
      flash[:error] = 'خطا در ثبت اطلاعات شخصی'
    end
  
  end

  # PATCH/PUT /partnerships/1
  # PATCH/PUT /partnerships/1.json
  def update
    respond_to do |format|
      if @partnership.update(partnership_params)
        format.html { redirect_to @partnership, notice: 'Partnership was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @partnership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partnerships/1
  # DELETE /partnerships/1.json
  def destroy
    @partnership.destroy
    respond_to do |format|
      format.html { redirect_to partnerships_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partnership
      @partnership = Partnership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def partnership_params
      params.require(:partnership).permit( :first_name, :last_name, :email, :father_name, :birthdate, :gender, :phone_number, :mobile, :farhangi, :address, :description)
    end
end
