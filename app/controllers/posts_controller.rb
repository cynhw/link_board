class PostsController < ApplicationController

  before_action :is_authenticated?, except: [:index]

  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	post = Post.create post_params do |p|
      p.user_id = @current_user.id
      p.save
    end
    if post.valid?
      flash[:success] = 'Post created.'
      redirect_to root_path
    else
      flash[:danger] = 'Please provide a longer title and a valid link.'
      redirect_to new_post_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :link)
  end

end
