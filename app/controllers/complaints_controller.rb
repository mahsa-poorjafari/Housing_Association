# encoding: UTF-8
class ComplaintsController < ApplicationController
  impressionist :actions=>[:show,:index]
  before_action :set_complaint, only: [:show, :edit, :update, :destroy]
  before_filter :check_autentication, only: [:edit]

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
      flash[:notice] = 'کاربر گرامی پیغام شما ارسال گردید.'      
    end
    render action: 'show'
  end

  # PATCH/PUT /complaints/1
  # PATCH/PUT /complaints/1.json
  def update
    respond_to do |format|
      if @complaint.update(complaint_params)
        format.html { redirect_to @complaint, notice: 'Complaint was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
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
      params.require(:complaint).permit(:user_id, :complaint_text, :complaint_answer, :subject)
    end
end
