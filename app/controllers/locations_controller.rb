class LocationsController < ApplicationController
  before_action :set_location, only: %i[show ]

  def recentlocations
    @recent = Location.joins(:plants)
                      .group('locations.id')
                      .order('COUNT(plants.id) DESC')
                      .limit(4)
  end

  def index
    @locations = Location.all
  end

  def show
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
    params.require(:location).permit(:name, :updated_at)
  end
end
