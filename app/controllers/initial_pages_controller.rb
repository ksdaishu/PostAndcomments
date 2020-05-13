class InitialPagesController < ApplicationController
  def home
    if user_signed_in?
      @user = current_user
      @posts = current_user.feed.paginate(page: params[:page],per_page: 8)
      render 'posts/index'      
    end
  end
end
