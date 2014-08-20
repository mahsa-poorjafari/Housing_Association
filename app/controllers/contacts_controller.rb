class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end
  
  def search
    q = params[:search]
    if q      
      @contact = Contact.search q      
      @cooperative = Cooperative.search q      
      @member = Member.search q
      
    end 
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Phone book was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Phone book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end


  def preson_names
    term = params[:term] || params[:q] #term is from jquery autocomplete and q is from token-input
    @contacts = Contact.order(:preson_name).where("preson_name like ?", "%#{term}%")
    render json: @contacts.map(&:preson_name)
  end
  def company_names
    term = params[:term] || params[:q] #term is from jquery autocomplete and q is from token-input
    @contacts = Contact.order(:company_name).where("company_name like ?", "%#{term}%")
    render json: @contacts.map(&:company_name)
  end
  def reciever_names
    term = params[:term] || params[:q] #term is from jquery autocomplete and q is from token-input
    @contacts = Contact.order(:preson_name).where("preson_name like ?", "%#{term}%")
    ret = @contacts.map{|c|{id:c.id, name:c.preson_name}}
    @contacts = Contact.order(:company_name).where("company_name like ?", "%#{term}%")
    ret += @contacts.map{|c|{id:c.id, name:c.company_name}}
    render json: ret
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:preson_name, :company_name, :phone, :fax, :address, :cooperative_id, :email)
    end
end
