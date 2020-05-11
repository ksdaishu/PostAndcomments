class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist


  def show_post( new_comment = Comment.new(author: current_user))
    render 'posts/show'
  end

  def new_post
    @post = Post.new
  end
end
