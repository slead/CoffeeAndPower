class CafesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do
    flash[:notice] = 'Sorry, that cafe does not exist'
    redirect_to action: :index
  end

	before_action :find_cafe, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]

  utf8_enforcer_workaround

	def index

    @geojson = Array.new
    if params[:bbox].present?
      #Find cafes which fall within the current map extent
      bbox = params[:bbox].split(",").map(&:to_f)
      @cafes = Cafe.within_bounding_box(bbox)
    else
      @cafes = Cafe.all  
    end

    # Make a JSON object from the Cafes, to add to the map
    @geojson += @cafes.collect do |cafe|
      {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [cafe.longitude, cafe.latitude]
        },
        properties: {
          type: "cafe",
          name: cafe.name,
          address: cafe.address,
          url: cafe.slug,
          description: cafe.description
        }
      }
    end

    respond_to do |format|
      format.html
      format.json { render json: @geojson }  # respond with the created JSON object
    end
    
	end

	def new
		@cafe = current_user.cafes.build
	end

	def create
		@cafe = current_user.cafes.build(cafe_params)
		@cafe.username = current_user.name
		if @cafe.save
      if ! @cafe.geocoded?
        flash[:alert] = "There was a problem geocoding cafe #{@cafe.name}."
      else
        flash[:notice] = "Cafe #{@cafe.name} added successfully."
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

		# Generate a URL for a live Google Map search
		@google_map_link = "https://www.google.com.au/maps/search/" + @cafe.address

    # Make a JSON object from this and nearby Cafes, to add to the map
    @geojson = [{
      type: 'Feature',
      geometry: {
        type: 'Point',
        coordinates: [@cafe.longitude, @cafe.latitude]
      },
      properties: {
        type: "cafe",
        name: @cafe.name,
        address: @cafe.address,
        url: @cafe.slug
      }
    }]

		# Find the cafes near this one and add them to the map. Sort them by distance
		@nearbys = []
		@cafe.nearbys(1).each do |nearby_cafe|
			@nearbys <<  { pointer: nearby_cafe, distance: @cafe.distance_to(nearby_cafe) }

      @geojson << {
      type: 'Feature',
      geometry: {
        type: 'Point',
        coordinates: [nearby_cafe.longitude, nearby_cafe.latitude]
      },
      properties: {
        type: "nearby_cafe",
        name: nearby_cafe.name,
        address: nearby_cafe.address,
        url: nearby_cafe.slug
      }
    }
		end
		@nearbys.sort_by {|_key, value| value}

    respond_to do |format|
      format.html
      format.json { render json: @geojson }  # respond with the created JSON object
    end

	end

	def edit
	end

	def update
		if @cafe.update(cafe_params)
      if !@cafe.geocoded?
        flash[:alert] = "There was a problem geocoding cafe #{@cafe.name}."
      else
        flash[:alert] = "Cafe #{@cafe.name} was successfully updated."
      end
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
		params.require(:cafe).permit(:name, :address, :description, :location_id, :city, :state)
	end

	def find_cafe
		# @cafe = Cafe.find(params[:id])
		@cafe = Cafe.friendly.find(params[:id])
	end

end
