class LetterTemplatesController < ApplicationController
  before_action :set_letter_template, only: [:show, :edit, :update, :destroy, :set]

  # GET /letter_templates
  # GET /letter_templates.json
  def index
    @letter_templates = LetterTemplate.all
  end

  # GET /letter_templates/1
  # GET /letter_templates/1.json
  def show
  end

  # GET /letter_templates/new
  def new
    @letter_template = LetterTemplate.new
  end

  # GET /letter_templates/1/edit
  def edit
  end

  # POST /letter_templates
  # POST /letter_templates.json
  def create
    @letter_template = LetterTemplate.new(letter_template_params)

    
    if @letter_template.save
      redirect_to new_letter_path
      
      
    else
      render action: 'new' 
      
    end
  
  end

  # PATCH/PUT /letter_templates/1
  # PATCH/PUT /letter_templates/1.json
  def update
    respond_to do |format|
      if @letter_template.update(letter_template_params)
        format.html { redirect_to @letter_template, notice: 'Letter template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @letter_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /letter_templates/1
  # DELETE /letter_templates/1.json
  def destroy
    @letter_template.destroy
    respond_to do |format|
      format.html { redirect_to letter_templates_url }
      format.json { head :no_content }
    end
  end

  def set
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_letter_template
      @letter_template = LetterTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def letter_template_params
      params.require(:letter_template).permit(:name, :content)
    end
end
