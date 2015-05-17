class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def index
    if params[:search].present?
      @locations = Location.search(params[:search])
    else
      @locations = Location.all
    end
  end

  def create
  end

  def autocomplete
    render json: Location.search(params[:query], autocomplete: true, limit: 10).map(&:name)
  end

  private

  def location_params
    params.require(:location).permit(:name, :id, :state, :country)
  end
end
