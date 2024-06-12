class LocationsController < ApplicationController
  before_action :set_location, only: %i[show]

  def recentlocations
    @status = Location.joins(:plants)
                      .where(user: current_user) # Ensure we only get the current user's locations
                      .where(plants: { state: ["needs caring"] })
                      .group('locations.id')
                      .limit(6)
    @recent = Location.joins(:plants)
                      .where(user: current_user)
                      .select('locations.*, MAX(plants.updated_at) as last_plant_update')
                      .group('locations.id')
                      .order('last_plant_update DESC')
                      .limit(4)
    @locations = Location.where(user: current_user)
    @plants = Plant.all
  end

  def index
    @locations = Location.where(user: current_user)
  end

  def show
    @location = Location.find(params[:id])
    @plant = Plant.new
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.user_id = current_user.id
    if @location.save
      redirect_to location_path(@location)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :updated_at, :photo)
  end
end
