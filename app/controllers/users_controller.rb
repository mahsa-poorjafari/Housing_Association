# encoding: UTF-8
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :check_autentication, only: [:new, :index, :show, :destroy]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user_pro = PayLimit.where(:user_id => @user.id)
  end
  
  # GET /users/new
  def new
    @user = User.new
    
  end
  def login
  end
  
  def new_inspector
    @generated_password = Devise.friendly_token.first(8)      
    @inspector_email = params[:inspector_email]
    @user = User.create!(:email => @inspector_email, :password => @generated_password, :role_id => 2)
    UserMailer.send_inspector_mail(@generated_password).deliver  
    if @user.present?
      flash[:AddInspector] = 'بازرس جدید تعریف شد. لطفا اطلاعات را کامل کنید'
      render action: 'edit'
    end
  end
  def new_subadmin
    @generated_password = Devise.friendly_token.first(8)      
    @subadmin_email = params[:subadmin_email]
    @user = User.create!(:email => @subadmin_email, :password => @generated_password, :role_id => 2)
    UserMailer.send_subadmin_mail(@generated_password).deliver  
    if @user.present?
      flash[:AddInspector] = 'مدیر جدید تعریف شد. لطفا اطلاعات را کامل کنید'
      render action: 'edit'
    end
  end
  # GET /users/1/edit
  def edit
    @role = Role.all
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)  
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to :root, notice: 'کاربر محترم شما عضو سایت شدید.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :last_name, :phone, :mobile, :birthdate, :address, :national_code, :role_id, :cooperative_code)
    end
end
