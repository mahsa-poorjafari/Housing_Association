class MemberPostsController < ApplicationController
  before_action :set_member_post, only: [:show, :edit, :update, :destroy]

  # GET /member_posts
  # GET /member_posts.json
  def index
    @member_posts = MemberPost.all
  end

  # GET /member_posts/1
  # GET /member_posts/1.json
  def show
  end

  # GET /member_posts/new
  def new
    @member_post = MemberPost.new
  end

  # GET /member_posts/1/edit
  def edit
  end

  # POST /member_posts
  # POST /member_posts.json
  def create
    @member_post = MemberPost.new(member_post_params)

    respond_to do |format|
      if @member_post.save
        format.html { redirect_to @member_post, notice: 'Member post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @member_post }
      else
        format.html { render action: 'new' }
        format.json { render json: @member_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /member_posts/1
  # PATCH/PUT /member_posts/1.json
  def update
    respond_to do |format|
      if @member_post.update(member_post_params)
        format.html { redirect_to @member_post, notice: 'Member post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @member_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_posts/1
  # DELETE /member_posts/1.json
  def destroy
    @member_post.destroy
    respond_to do |format|
      format.html { redirect_to member_posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_post
      @member_post = MemberPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_post_params
      params.require(:member_post).permit(:title)
    end
end
