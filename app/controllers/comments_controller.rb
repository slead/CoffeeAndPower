class CommentsController < ApplicationController
    def create
      @cafe = Cafe.find(params[:cafe_id])
      @comment = @cafe.comments.create(params[:comment].permit(:comment))
      @comment.user = current_user

      if @comment.save
        redirect_to cafe_path(@cafe)
      else
        render 'new'
      end
    end
end
