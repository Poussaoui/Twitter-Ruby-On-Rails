class PostsController < ApplicationController

  def create
    @user=User.find(params[:user_id])
    @post=@user.posts.new(post_params)
    # @post.user_id=session[:user].to_i
    @post.save
    redirect_to user_path(@user)
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
