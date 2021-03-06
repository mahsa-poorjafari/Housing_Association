# encoding: UTF-8
class LettersController < ApplicationController  
  
  before_action :set_letter, only: [:show, :edit, :update, :destroy, :printa4]
  before_filter :check_autentication
  respond_to :xls, :html
  PAPERSIZE = 0
  
  # GET /letters
  # GET /letters.json
  def index
    #@letters = Letter.all(include:"sender")
    if params[:email_list].present?      
      @except_mail = Letter.where(letter_type: "email")
    else
      @except_mail = Letter.where.not(letter_type: "email")
    end
    @letters = @except_mail.order(" created_at desc")
    filename = "اندیکاتور-" + Date.today.to_s
    respond_to do |format|
      format.html
      format.xlsx { render xlsx: :index, filename: filename}
    end
  end

  # GET /letters/1
  # GET /letters/1.json
  
   
  def show
    
  end

  # GET /letters/new
  def new
    letter_type = params["letter_type"] || Letter::LetterTypes[:sent]
    
    @letter_type_show = params[:letter_type] 
    @letter = Letter.new(letter_type:letter_type)
    @current_date = JalaliDate.new(Date.today)
    @current_year = JalaliDate.new(Date.today).strftime("%y")
    if Letter.last.present?
      p @last_letter = Letter.maximum(:letter_number)
      
       @last_letter_split = @last_letter.split('/').first
      
       @last_letter_split = @last_letter_split.to_i
       @last_letter_split = @last_letter_split + 1
       @last_letter_split = @last_letter_split.to_s
      
    else
      @last_letter_split = 100
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
  def printa4
    p '-------papersizeA4----------'
    p $papersize = 1
    respond_to do |format|
      format.html do
        render 'printa4.html',  :layout => 'a4size.html'
      end
    end
  end
  def printa5
    p '-------papersizeA5----------'
    p $papersize = 2
    
    #respond_to do |format|
     # format.html do
      #  render 'printa5.html',  :layout => 'a5size.html'
      #end
    #end
  end

  # GET /letters/1/edit
  def edit
    

    p @letter_type_show = params[:letter_type] 
    @pdf_destroy= params[:pdf_destroy]
    if @pdf_destroy.present?
      @letter.update_attribute(:scan_file, nil)
      render action: 'show'
    end

  end

  # POST /letters
  # POST /letters.json
  def create
    @letter = Letter.new(letter_params)
     @current_year = params[:current_year]
     @alphabet = params[:alphabet] 
     @counter_number = params[:counter_number]
     @type_of_letter = params[:type_of_letter]
    if @counter_number && @alphabet && @current_year
      @letter_number =   @counter_number +  '/' + @alphabet + '/' +@current_year
      @letter.letter_number = @letter_number
    end
    if @letter.letter_type == 'recieved'
      @addcontact = Contact.new(preson_name: @letter.senderpreson_name, company_name: @letter.sendercompany_name)
      @addcontact.save!
      p '----Add To Contact-----'
    
    end
    
    if @letter.save
      redirect_to @letter
      flash[:letter] = 'نامه در سیستم ثبت شد' 
      
      if params[:letter_type_email]  == 'email'
        if params[:send_all] == 'send_to_all'
          
          @cooperative = Contact.where.not('cooperative_id' => nil)
           @recievers = @cooperative.map { |x| x[:id] }          
          @letter.update_attribute(:reciever_ids, @recievers.collect )
          UserMailer.send_group_mail(@letter).deliver      
        end
      end
      
    else
      render action: 'new'      
    end
  
  end

  # PATCH/PUT /letters/1
  # PATCH/PUT /letters/1.json
  def update
    
    if @letter.update(letter_params)
      redirect_to @letter
      flash[:editletter] =  'ویرایش انجام شد.' 
      @type_of_letter = params[:type_of_letter]
    else
      render action: 'new' 
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
      @letter = Letter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def letter_params
      params.require(:letter).permit(:letter_type, :summary, :sent_date_fa, :received_date_fa,
       :senderpreson_name, :sendercompany_name, :content, :attachment, :reciever_ids, :reciever_tokens,
       :letter_number, :scan_file, :received_letter_number, :ehteramn)
    end
end
