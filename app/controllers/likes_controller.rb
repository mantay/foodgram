class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @like = current_user.likes.build(post_id: params['like']['post_id'])
    if @like.save
      @like.post.likes_count += 1
      @like.post.save
      redirect_to :back
    end
  end

  def destroy
    @like = current_user.likes.find_by(post_id: params['like']['post_id'])
    if @like.destroy!
      @like.post.likes_count -= 1
      @like.post.save
      redirect_to :back
    end
  end

end
