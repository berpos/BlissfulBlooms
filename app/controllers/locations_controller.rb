class LocationsController < ApplicationController

  def recentlocations
    @recent = Location.all.order("updated_at DESC").limit(4)
  end

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
   # @plants = @location.plants
    @plant = Plant.new
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :updated_at)
  end
end
