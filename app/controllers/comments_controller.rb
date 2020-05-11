class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_post, only: [:create]


  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @postinfo

    if @comment.save
      redirect_to @postinfo, notice: 'Comment was successfully created.'
    else
      flash.now[:warning] = 'Comment not created'
      if @postinfo.class == Post
        @post = @postinfo
        show_post(@comment)      
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
     if @comment.update(comment_params)
      redirect_to @comment.post, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    commentable = @comment.post
    @comment.destroy
    redirect_back fallback_location: commentable,
      notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body)
    end

    def set_post
      if post_id = params[:post_id]
        @postinfo = Post.find_by_id(post_id)
      end
    end
end
