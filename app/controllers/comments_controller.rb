class CommentsController < ApplicationController
  
  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to comment.customer
    else
      render 'customer/show'  # 別のコントローラのビューへ 本当は template: をつける
    end
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to comment.customer
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body, :customer_id, :user_id)
  end
  
end
