class CommentsController < ApplicationController
  def create
    @cafe = Cafe.find(params[:cafe_id])
    @comment = Comment.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.cafe_id = @cafe.id
    
    if @comment.save
      redirect_to cafe_path(@cafe)
    else
      render 'new'
    end
  end
end
