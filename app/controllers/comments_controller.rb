class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @comment = current_user.comments.build(comments_params)
    if @comment.save
      redirect_to :back
    else
      flash[:warning] = "Комментарий должен быть не более 140 символов, ну и... он вообще должен быть"
      redirect_to :back
    end
  end

  def destroy
    @comment = current_user.comments.find_by(id: params[:id])
    @comment.destroy
    redirect_to :back
  end

  private

    def comments_params
      params.require(:comment).permit(:text, :post_id)
    end

end
