class CommentComplaintsController < ApplicationController
  before_action :set_comment_complaint, only: [:show, :edit, :update, :destroy]
  before_filter :check_autentication, only: [:new]
  # GET /comment_complaints
  # GET /comment_complaints.json
  def index
    @comment_complaints = CommentComplaint.all
  end

  # GET /comment_complaints/1
  # GET /comment_complaints/1.json
  def show
  end

  # GET /comment_complaints/new
  def new
    @comment_complaint = CommentComplaint.new
  end

  # GET /comment_complaints/1/edit
  def edit
  end

  # POST /comment_complaints
  # POST /comment_complaints.json
  def create
    @comment_complaint = CommentComplaint.new(comment_complaint_params)
    
    @comment_complaint.save
    redirect_to :back
  end

  # PATCH/PUT /comment_complaints/1
  # PATCH/PUT /comment_complaints/1.json
  def update
    respond_to do |format|
      if @comment_complaint.update(comment_complaint_params)
        format.html { redirect_to @comment_complaint, notice: 'Comment complaint was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment_complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_complaints/1
  # DELETE /comment_complaints/1.json
  def destroy
    @comment_complaint.destroy
    respond_to do |format|
      format.html { redirect_to comment_complaints_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_complaint
      @comment_complaint = CommentComplaint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_complaint_params
      params.require(:comment_complaint).permit(:user_id, :complaint_id, :text)
    end
end
