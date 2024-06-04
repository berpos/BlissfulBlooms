class LocationsController < ApplicationController
  def show
    @location = Location.find(params[:id])
   # @plants = @location.plants
  end
end
