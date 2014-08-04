# encoding: UTF-8
class PayLimitsController < ApplicationController
  before_action :set_pay_limit, only: [:show, :edit, :update, :destroy]
  
  # GET /pay_limits
  # GET /pay_limits.json
  def index
    @pay_limits = PayLimit.all
  end

  # GET /pay_limits/1
  # GET /pay_limits/1.json
  def show
    
  end
  
  def search
    code = params[:search]   
    if code      
      @find_code = PayLimit.search(code)
    end 
  end
  
  
  # GET /pay_limits/new
  def new
    @pay_limit = PayLimit.new
    @project_id = params[:project_id]
    @partnership_id = params[:partnership_id]
    if @project_id
      @project = Project.find(@project_id)
    else
      @projects = Project.all
    end
  end

  # GET /pay_limits/1/edit
  def edit
  end

  # POST /pay_limits
  # POST /pay_limits.json
  def create
    @pay_limit = PayLimit.new(pay_limit_params)
    @tracking_code = Devise.friendly_token.first(10)
    @pay_limit.tracking_code = @tracking_code
    @project_id = params[:pro_id]
    @partnership_id = params[:partnership_id]
    
    if @pay_limit.save
      CodeMailer.send_pro_reg_code.deliver      
      flash[:CodeSend] = 'کاربر گرامی کدرهگیری به ایمیل شما ارسال گردید.' 
      render action: 'show'
    
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /pay_limits/1
  # PATCH/PUT /pay_limits/1.json
  def update
    respond_to do |format|
      if @pay_limit.update(pay_limit_params)
        format.html { redirect_to @pay_limit, notice: 'Pay limit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pay_limit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pay_limits/1
  # DELETE /pay_limits/1.json
  def destroy
    @pay_limit.destroy
    respond_to do |format|
      format.html { redirect_to pay_limits_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pay_limit
      @pay_limit = PayLimit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pay_limit_params
      params.require(:pay_limit).permit(:amount, :project_id, :description, :partnership_id, :tracking_code, :accept_description, :accept)
    end
end
