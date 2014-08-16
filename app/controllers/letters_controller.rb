# encoding: UTF-8
class LettersController < ApplicationController
  before_action :set_letter, only: [:show, :edit, :update, :destroy]

  # GET /letters
  # GET /letters.json
  def index
    #@letters = Letter.all(include:"sender")
    @letters = Letter.order(" created_at desc")
    
  end

  # GET /letters/1
  # GET /letters/1.json
  
   
  def show
    
  end

  # GET /letters/new
  def new
    letter_type = params["letter_type"] || Letter::LetterTypes[:sent]
    p '111'
    p @letter_type_show = params[:letter_type] 
    @letter = Letter.new(letter_type:letter_type)
    @current_date = JalaliDate.new(Date.today)
    @current_year = JalaliDate.new(Date.today).strftime("%y")
    if Letter.last.present?
      @last_letter = Letter.last.letter_number
      p @last_letter_split = @last_letter.split('/').first
      p '1111111111'
      p @last_letter_split = @last_letter_split.to_i
      p @last_letter_split = @last_letter_split + 1
      p @last_letter_split = @last_letter_split.to_s
      p '222222222'
    end
    
    
  end
  def cunter
    c = params[:cunter]    
    if Letter.last.letter_number >= c
      p @permission_error = 'شماره وارد شده مجاز نمی باشد.'
    else
      p @start_count = c
    end
  end

  # GET /letters/1/edit
  def edit
  end

  # POST /letters
  # POST /letters.json
  def create
    @letter = Letter.new(letter_params)
    p @current_year = params[:current_year]
    p @alphabet = params[:alphabet] 
    p @counter_number = params[:counter_number]
    p @type_of_letter = params[:type_of_letter]
    
    p @letter_number = @counter_number +  '/' + @alphabet  + '-' + @current_year +'/'+ @type_of_letter 
    @letter.letter_number = @letter_number
    
    if @letter.save
      redirect_to @letter
      flash[:letter] = 'نامه در سیستم ثبت شد' 
    else
      render action: 'new'      
    end
  
  end

  # PATCH/PUT /letters/1
  # PATCH/PUT /letters/1.json
  def update
    respond_to do |format|
      if @letter.update(letter_params)
        format.html { redirect_to @letter, notice: 'ویرایش انجام شد.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /letters/1
  # DELETE /letters/1.json
  def destroy
    @letter.destroy
    respond_to do |format|
      format.html { redirect_to letters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_letter
      @letter = Letter.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def letter_params
      params.require(:letter).permit(:letter_type, :summary, :sent_date_fa, :received_date_fa, :senderpreson_name, :sendercompany_name, :content, :attachment, :reciever_ids, :reciever_tokens, :letter_number)
    end
end
