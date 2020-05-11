class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist


  def show_post( new_comment = Comment.new(user: current_user))

  	author = @post.user
  	@comments = @post.comments.order(:created_at).paginate(page: params[:page]).per_page(10)
    @new_comment = new_comment

    render 'posts/show'
  end

  def new_post
    @post = Post.new
  end
end
