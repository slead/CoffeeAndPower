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
      @cafes = Cafe.within_bounding_box(bbox).paginate(:page => params[:page], :per_page => 6)

    elsif params[:search].present?
      
      # Find cafes which match this location
      @location_search_results = Location.search(params[:search])
      if @location_search_results.any?
        loc_ids = []
        @location_search_results.each do |loc|
          loc_ids << loc.id
        end
        @cafes = Cafe.where(location_id: loc_ids).paginate(:page => params[:page], :per_page => 6)
      else
        # If there are no matching Locations, perform a spatial search based on the entered location
        search_location = Geocoder.coordinates(params[:search])
        @geojson += [{
          type: 'Feature',
          geometry: {
            type: 'Point',
            coordinates: [search_location[1], search_location[0]]
          },
          properties: {
            type: "location",
            name: params[:search],
            color: '#00607d',
            symbol: 'circle',
            size: 'small'
          }
        }]
        @cafes = Cafe.near(search_location, 10).paginate(:page => params[:page], :per_page => 6)
      end

    else
      @cafes = Cafe.all.order("CREATED_AT").paginate(:page => params[:page], :per_page => 6)
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
          color: '#00607d',
          symbol: 'circle',
          size: 'medium'
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
			flash[:notice] = "Cafe #{@cafe.name} added successfully."

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
        url: @cafe.slug,
        color: '#00607d',
        symbol: 'circle',
        size: 'medium'
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
        url: nearby_cafe.slug,
        color: '#e9e9e9',
        symbol: 'circle',
        size: 'small'
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
      if @cafe.geocoded?
        update_location
      else
        flash[:alert] = "There was a problem geocoding cafe #{@cafe.name}."
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

  #Locations are basically cities/suburbs where we have at least one cafe
  def update_location
    @location = Location.where(name: @cafe.city)
    # If there is an existing location, relate it to the cafe
    if @location.any?
      @cafe.location_id = @location.take.id
    # Otherwise, geocode a new location based on this cafe's name, state & country
    else
      @location = Location.new(name: @cafe.city)
      @location.state = @cafe.state
      @location.country = @cafe.country
      xy = Geocoder.coordinates(@location.name.to_s + "," + @location.state.to_s + "," + @location.country)
      @location.latitude = xy[0]
      @location.longitude = xy[1]
      @location.save
      @cafe.location_id = @location.id
    end
    @cafe.save
  end
end
