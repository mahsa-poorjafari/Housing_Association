class HouseNewsController < ApplicationController
  before_action :set_house_news, only: [:show, :edit, :update, :destroy]

  # GET /house_news
  # GET /house_news.json
  def index
    @house_news = HouseNew.all
  end

  # GET /house_news/1
  # GET /house_news/1.json
  def show
  end

  # GET /house_news/new
  def new
    @house_news = HouseNew.new
  end

  # GET /house_news/1/edit
  def edit
  end

  # POST /house_news
  # POST /house_news.json
  def create
    @house_news = HouseNew.new(house_news_params)

    respond_to do |format|
      if @house_news.save
        format.html { redirect_to @house_news, notice: 'House new was successfully created.' }
        format.json { render action: 'show', status: :created, location: @house_news }
      else
        format.html { render action: 'new' }
        format.json { render json: @house_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /house_news/1
  # PATCH/PUT /house_news/1.json
  def update
    respond_to do |format|
      if @house_news.update(house_news_params)
        format.html { redirect_to @house_news, notice: 'House new was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @house_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /house_news/1
  # DELETE /house_news/1.json
  def destroy
    @house_news.destroy
    respond_to do |format|
      format.html { redirect_to house_news_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house_news
      @house_news = HouseNew.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_news_params
      params.require(:house_news).permit(:title, :text, :number_Visit, :Important)
    end
end
