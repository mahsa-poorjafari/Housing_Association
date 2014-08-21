# encoding: UTF-8
class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
   before_filter :check_autentication_cooperative
  # GET /members
  # GET /members.json
  def index
    
    if params[:cooperative_id].present?
      @current_cooperative = Cooperative.find(params[:cooperative_id])
      @members = @current_cooperative.members
    else
      @members = Member.all
    end
    
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end
  def search   
    @result = Member.search params[:search]    
  end
  # GET /members/new
  def new
    @member = Member.new
    if params[:cooperative_id].present? 
      @cooperative_id =  params[:cooperative_id]
      @current_cooperative = Cooperative.find(params[:cooperative_id])
    end
      
  end
  

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
   
    if @member.member_post_id.blank?
      @default_member_post = MemberPost.find_by_title('عضو تعاونی')
      @member.member_post_id = @default_member_post.id
      p '111111111111'
      p @member
    end
    
    @saved = false
    if @saved = @member.save      
      flash[:done] =  'عضو جدید با موفقیت ثبت گردید.' 
      
    else
      flash[:error] = 'خطا در ثبت عضو' 
      p @member.errors
    end
  
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    
    @update = @member.update(member_params)
    if @update
      flash[:done] = 'ویرایش اطلاعات انجام شد.'
    else
      flash[:error] = 'خطا در ویرایش اطاعات'
    end
    
    
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:name, :last_name, :email, :phone_number, :mobile, :address, :postal_code, :father_name, :birthdate_fa, :national_id_card, :identify_number, :image, :cooperative_id, :member_post_id, :deactive, :paid_member)
    end
end
