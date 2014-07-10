class PdfFormsController < ApplicationController
  before_action :set_pdf_form, only: [:show, :edit, :update, :destroy]

  # GET /pdf_forms
  # GET /pdf_forms.json
  def index
    @pdf_forms = PdfForm.all
  end

  # GET /pdf_forms/1
  # GET /pdf_forms/1.json
  def show
  end

  # GET /pdf_forms/new
  def new
    @pdf_form = PdfForm.new
  end

  # GET /pdf_forms/1/edit
  def edit
  end

  # POST /pdf_forms
  # POST /pdf_forms.json
  def create
    @pdf_form = PdfForm.new(pdf_form_params)

    respond_to do |format|
      if @pdf_form.save
        format.html { redirect_to @pdf_form, notice: 'Pdf form was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pdf_form }
      else
        format.html { render action: 'new' }
        format.json { render json: @pdf_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pdf_forms/1
  # PATCH/PUT /pdf_forms/1.json
  def update
    respond_to do |format|
      if @pdf_form.update(pdf_form_params)
        format.html { redirect_to @pdf_form, notice: 'Pdf form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pdf_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pdf_forms/1
  # DELETE /pdf_forms/1.json
  def destroy
    @pdf_form.destroy
    respond_to do |format|
      format.html { redirect_to pdf_forms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pdf_form
      @pdf_form = PdfForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pdf_form_params
      params.require(:pdf_form).permit(:title, :description, :pdf, :image)
    end
end
