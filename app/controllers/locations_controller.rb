class LocationsController < ApplicationController

  before_action :set_location, only: %i[show ]

  def recentlocations
    @status = Location.joins(:plants)
                      .group('locations.id')
                      .where(plants: { state: ['dehydrated', 'messy', 'degradated', 'dying'] })
                      .limit(6)
    @recent = Location.joins(:plants)
                      .group('locations.id')
                      .order('COUNT(plants.id) DESC')
                      .limit(4)
    @locations = Location.all
    @plants = Plant.all
  end

  def index
    @locations = Location.all
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
      redirect_to locations_path
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
