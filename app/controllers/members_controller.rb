# encoding: UTF-8
class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
   before_filter :check_autentication_cooperative
  # GET /members
  # GET /members.json
  def index
    if is_admin? || current_user.blank?
      @members = Member.all
    else
      @cooperative_id = params[:cooperative_id]
      @current_cooperative = Cooperative.find(params[:cooperative_id])
      @members = @current_cooperative.members
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
    @cooperative_id = params[:cooperative_id]
    @current_cooperative = Cooperative.find(params[:cooperative_id])
    
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
   
    if @member.member_post_id.blank?
      @default_mamber_post = MemberPost.find_by_title('عضو تعاونی')
      @member.member_post_id = @default_mamber_post.id
    end
    
    @saved = false
    if @saved = @member.save      
      flash[:done] =  'عضو جدید با موفقیت ثبت گردید.' 
      
    else
      flash[:error] = 'خطا در ثبت عضو'
    end
  
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, done: 'ویرایش اطلاعات انحام شد.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
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
      @member = Member.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:name, :last_name, :email, :phone_number, :mobile, :address, :postal_code, :father_name, :birthdate, :national_id_card, :identify_number, :image, :cooperative_id, :member_post_id, :deactive, :paid_member)
    end
end
