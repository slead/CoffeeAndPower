class CafesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do
    flash[:notice] = 'Sorry, that cafe does not exist'
    redirect_to action: :index
  end

	before_action :find_cafe, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]

	def index
		@cafes = Cafe.all.order("CREATED_AT")
	end

	def new
		@cafe = current_user.cafes.build
	end

	def create
		@cafe = current_user.cafes.build(cafe_params)
		if @cafe.save
			flash[:notice] = "Cafe #{@cafe.name} added successfully."
			redirect_to @cafe
		else
			render 'new'
		end
	end

	def show
		@comments = Comment.where(cafe_id: @cafe)
	end

	def edit
	end

	def update
		if @cafe.update(cafe_params)
			redirect_to @cafe
		else
			render 'edit'
		end
	end

	def destroy
			@cafe.destroy
			flash[:notice] = "Cafe #{@cafe.name} deleted successfully."
			redirect_to root_path
	end

	def upvote
    @cafe.upvote_by current_user
    redirect_to :back
  end
  
  def downvote
    @cafe.downvote_by current_user
    redirect_to :back  
  end

	private

	def cafe_params
		params.require(:cafe).permit(:name, :address, :description)
	end

	def find_cafe
		@cafe = Cafe.find(params[:id])
	end
end
