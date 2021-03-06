# encoding: UTF-8
class ProjectsController < ApplicationController
  impressionist :actions=>[:show,:index]
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :check_autentication, only: [:new, :edit]
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.order(" created_at desc")
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    impressionist(@project, "message...") # 2nd argument is optional
    if current_user
      @member_id = current_user.id    
      @reg_before = PayLimit.where( {user_id: @member_id , project_id:  @project.id })      
      @pro_informs = Inform.where( { project_id:  @project.id })      
    end
  end

  # GET /projects
  def new
    @project = Project.new
    
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
   
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'پروژه جدید ایجاد شد. ' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'تغییر اطلاعات انجام شد.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :address, :description, :Area, :unit, :Status, 
            :land_area, :floor, :block , :start_year, :finish_year,
            pictures_attributes: [:image, :description, :_destroy, :_update]          
            )
    end
end
