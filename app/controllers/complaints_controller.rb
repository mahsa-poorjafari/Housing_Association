# encoding: UTF-8
class ComplaintsController < ApplicationController
  impressionist :actions=>[:show,:index]
  before_action :set_complaint, only: [:show, :edit, :update, :destroy, :send_and_display_answer]
  before_filter :check_autentication_complaint, only: [:show, :edit, :update, :destroy]

  # GET /complaints
  # GET /complaints.json
  def index
    @complaints = Complaint.all
  end

  # GET /complaints/1
  # GET /complaints/1.json
  def show
    @commits = CommentComplaint.where(:complaint_id => @complaint.id)
    impressionist(@complaint, "message...") # 2nd argument is optional
  end
  
  def send_answer    
    SendComplaint.admin_confirm_answer.deliver  
    flash[:notice] = 'نتیجه داوری برای کاربر ارسال گردید'  
    redirect_to :back
  end
  
  def send_and_display_answer
    @complaint.update_attribute(:display, true)
    if @complaint
      SendComplaint.admin_confirm_answer.deliver  
      flash[:notice] = 'نتیجه داوری برای کاربر ارسال گردید و در سایت نیز نمایش داده خواهد شد'  
    end
    redirect_to :back
  end

  # GET /complaints/new
  def new
    @complaint = Complaint.new
  end

  # GET /complaints/1/edit
  def edit
  end

  # POST /complaints
  # POST /complaints.json
  def create
    @complaint = Complaint.new(complaint_params)

    if @complaint.save
      SendComplaint.send_complaint_to_Inspector.deliver      
      flash[:notice] = 'کاربر گرامی پرسش شما ارسال گردید.'      
    end
    redirect_to :back
  end

  # PATCH/PUT /complaints/1
  # PATCH/PUT /complaints/1.json
  def update  
    
    if @complaint.update(complaint_params)
      flash[:notice] = 'پاسخ شما ارسال گردید.' 
    end
    redirect_to :back    
    
  end

  # DELETE /complaints/1
  # DELETE /complaints/1.json
  def destroy
    @complaint.destroy
    respond_to do |format|
      format.html { redirect_to complaints_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint
      @complaint = Complaint.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def complaint_params
      params.require(:complaint).permit(:complaint_text, :complaint_answer, :subject, :user_email, :user_phone, :display)
    end
end
