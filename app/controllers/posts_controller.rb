class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
    @post = current_user.posts.build
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user

    @comment = @post.comments.build
    @like = @post.likes.build
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created"
      redirect_to current_user
    else
      render 'posts/index'
    end
  end

  def destroy
    @post = current_user.posts.find_by(id: params['id'])
    if @post.destroy!
      flash[:success] = "Ваш пост удален"
      redirect_to current_user
    end
  end

  def image_rating
    @images = Post.all
  end

  private

    def post_params 
      params.require(:post).permit(:content, :image)
    end

end
