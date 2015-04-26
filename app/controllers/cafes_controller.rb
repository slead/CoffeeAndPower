class CafesController < ApplicationController

	before_action :find_cafe, only: [:show, :edit, :update, :destroy]

	def index
		@cafes = Cafe.all.order("CREATED_AT")
	end

	def new
		@cafe = Cafe.new
	end

	def create
		@cafe = Cafe.new(cafe_params)
		if @cafe.save
			redirect_to @cafe
		else
			render 'new'
		end
	end

	def show	
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
			redirect_to root_path
	end

	private

	def cafe_params
		params.require(:cafe).permit(:name, :address)
	end

	def find_cafe
		@cafe = Cafe.find(params[:id])
	end
end
