class CommentsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def create
      @cafe = Cafe.friendly.find(params[:cafe_id])
      @comment = @cafe.comments.create(params[:comment].permit(:comment))
      @comment.user = current_user

      if @comment.save
        redirect_to cafe_path(@cafe)
      else
        render 'new'
      end
    end

    def destroy
      @cafe = Cafe.friendly.find(params[:cafe_id])
      @comment = @cafe.comments.find(params[:id])
      @comment.destroy
      redirect_to cafe_path(@cafe)
  end
end
