# encoding: UTF-8
class SendLinksController < ApplicationController
  before_action :set_send_link, only: [:show, :edit, :update, :destroy]
  before_filter :check_autentication
  # GET /send_links
  # GET /send_links.json
  def index
    @send_links = SendLink.all
  end

  # GET /send_links/1
  # GET /send_links/1.json
  def show
  end

  # GET /send_links/new
  def new
    @send_link = SendLink.new
  end

  # GET /send_links/1/edit
  def edit
  end

  # POST /send_links
  # POST /send_links.json
  def create
    @send_link = SendLink.new(send_link_params)

    if @send_link.save
      UrlMailer.send_friend_link.deliver      
      @deliver = 'کاربر گرامی پیام شما ارسال گردید.'
    end
    redirect_to :back
  end

  # PATCH/PUT /send_links/1
  # PATCH/PUT /send_links/1.json
  def update
    respond_to do |format|
      if @send_link.update(send_link_params)
        format.html { redirect_to @send_link, notice: 'Send link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @send_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /send_links/1
  # DELETE /send_links/1.json
  def destroy
    @send_link.destroy
    respond_to do |format|
      format.html { redirect_to send_links_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_send_link
      @send_link = SendLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def send_link_params
      params.require(:send_link).permit(:sender_email, :receiver_email, :current_link, :text, :subject)
    end
end
