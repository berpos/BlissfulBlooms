class LocationsController < ApplicationController

  def recentlocations
    @recent = Location.all.order("updated_at DESC").limit(4)
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :updated_at)
  end
end
