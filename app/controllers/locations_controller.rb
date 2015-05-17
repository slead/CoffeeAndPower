class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
  end

  private

  def location_params
    params.require(:location).permit(:name, :id, :state, :country)
  end
end
