class CommentsController < ApplicationController
    def create
      @cafe = Cafe.find(params[:cafe_id])
      @comment = Comment.create(params[:comment].permit(:comment))

      if @comment.save
        redirect_to cafe_path(@cafe)
      else
        render 'new'
      end
    end

end
