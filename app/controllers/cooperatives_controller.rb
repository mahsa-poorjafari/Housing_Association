# encoding: UTF-8
class CooperativesController < ApplicationController
  before_action :set_cooperative, only: [:show, :edit, :update, :destroy]
  before_filter :check_autentication_cooperative, only: [:new, :edit]
  # GET /cooperatives
  # GET /cooperatives.json
  def index
    if current_user.present?    
      @user_email = current_user.email
    end
    if is_admin?
      @cooperatives = Cooperative.order('name DESC')    
    elsif is_user?
      @cooperatives = Cooperative.where( email_company: @user_email)
    else
      @cooperatives = Cooperative.order('name DESC')    
    end
    
    
  end

  # GET /cooperatives/1
  # GET /cooperatives/1.json
  def show
  end
  def select_group
    if is_admin?
      @cooperatives = Cooperative.order('name DESC')  
    else
      flash[:PermissonError] = 'دسترسی غیر مجاز است.'
    end    
  end
  def send_email_group
    @cooperative_ids = params[:cooperative_ids]  
    
    
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
    
    if @cooperative.save            
      flash[:AddCooper] = 'تعاونی جدید ثبت شد و اطلاعات ورود به سایت ارسال شد.' 
      @generated_password = Devise.friendly_token.first(8)      
      user = User.create!(:email => @cooperative.email_company, :password => @generated_password, :name => @cooperative.name, :last_name => @cooperative.managment_name , :phone => @cooperative.phone, :address => @cooperative.address, :role_id => 4, :cooperative_code => @cooperative.id)
      user = Contact.create!(:email => @cooperative.email_company, :company_name => @cooperative.name, :preson_name => @cooperative.managment_name , :phone => @cooperative.phone, :address => @cooperative.address, :cooperative_id => @cooperative.id)
      UserMailer.send_cooperative_mail(@generated_password).deliver  
      render action: 'show'      
    else
      flash[:AddCooper] = 'خطا در ثبت تعاونی جدید' 
      render action: 'new'       
    end
  
  end

  # PATCH/PUT /cooperatives/1
  # PATCH/PUT /cooperatives/1.json
  def update
   
    if @cooperative.update(cooperative_params)
      
      flash[:AddCooper] = 'ویرایش انجام شد'        
      render action: 'show'      
    else
      flash[:AddCooper] = 'خطا در ویرایش اطلاعات'
      render action: 'new'     
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
      params.require(:cooperative).permit(:name, :managment_name, :board_Chairman_name, :address, :phone, :website, :email_company, :fax)
    end
end
