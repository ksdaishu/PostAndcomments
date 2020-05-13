class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :new_post, only: [:index, :new]

  # GET /posts
  # GET /posts.json
  def index
    if !(user = params[:user_id]&.to_i)
      @posts = current_user.feed.paginate(page: params[:page],per_page: 8)
    elsif (user == current_user.id)
      @posts = Post.where(user_id: user)   
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    show_post
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)
      if @post.save
        redirect_to posts_url, notice: 'Post was created successfully.'
      else
        render :new
      end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
     if @post.update(post_params)
        redirect_to posts_url, notice: 'Post was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.fetch(:post, {}).permit(:user_id,:body)
    end
end
