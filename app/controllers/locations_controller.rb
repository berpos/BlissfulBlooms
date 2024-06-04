class LocationsController < ApplicationController
<<<<<<< HEAD
  def show
    @location = Location.find(params[:id])
   # @plants = @location.plants
=======
  def index
    @locations = Location.all
>>>>>>> master
  end
end
