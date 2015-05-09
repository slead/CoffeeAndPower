class CafesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do
    flash[:notice] = 'Sorry, that cafe does not exist'
    redirect_to action: :index
  end

	before_action :find_cafe, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]

	def index
		@cafes = Cafe.all.order("CREATED_AT")
    @locations = Location.all.order("Name")
	end

	def new
		@cafe = current_user.cafes.build
	end

	def create
		@cafe = current_user.cafes.build(cafe_params)
		@cafe.username = current_user.name
		if @cafe.save
			flash[:notice] = "Cafe #{@cafe.name} added successfully."

      # Associate the cafe with a Location, creating a new Location if needed
      if @cafe.geocoded?
        update_location
      else
        flash[:alert] = "There was a problem geocoding cafe #{@cafe.name}."
      end

			redirect_to @cafe
		else
      errors = []
      @cafe.errors.full_messages.each do |msg|
        errors << msg
      end
      flash.now[:error] = errors
			render 'new'
		end
	end

	def show
		@comments = Comment.where(cafe_id: @cafe)

		# Create a static Google Map, centred around this cafe
		@map_image = "https://maps.googleapis.com/maps/api/staticmap?zoom=17&size=450x450&center=" +
			@cafe.latitude.to_s + "," + @cafe.longitude.to_s +
			"&markers=icon:http://chart.apis.google.com/chart?chst=d_map_pin_icon%26chld=cafe%7C" +
			@cafe.latitude.to_s + "," + @cafe.longitude.to_s

		# Generate a URL for a live Google Map search
		@google_map_link = "https://www.google.com.au/maps/search/" + @cafe.address

		# Find the cafes near this one and add them to the map. Sort them by distance
		@nearbys = []
		@cafe.nearbys(1).each do |nearby_cafe|
			@nearbys <<  { pointer: nearby_cafe, distance: @cafe.distance_to(nearby_cafe) }
			@map_image += "&markers=olor:blue%7C" + nearby_cafe.latitude.to_s + "," + nearby_cafe.longitude.to_s
		end
		@nearbys.sort_by {|_key, value| value}
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

  #Locations are basically cities/suburbs where we have at least one cafe
  def update_location
    @location = Location.where(name: @cafe.city)
    if @location.any?
      @cafe.location_id = @location.take.id
    else
      @location = Location.new(name: @cafe.city)
      xy = Geocoder.coordinates(@location.name)
      @location.latitude = xy[0]
      @location.longitude = xy[1]
      @location.save
      @cafe.location_id = @location.id
    end
    @cafe.save
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
		params.require(:cafe).permit(:name, :address, :description, :location_id)
	end

	def find_cafe
		# @cafe = Cafe.find(params[:id])
		@cafe = Cafe.friendly.find(params[:id])
	end
end
