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

  private

  def location_params
    params.require(:location).permit(:name, :id, :state, :country)
  end
end
