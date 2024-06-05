class LocationsController < ApplicationController
  before_action :set_location, only: %i[show new]

  def recentlocations
    @recent = Location.all.order("updated_at DESC").limit(4)
  end

  def index
    @locations = Location.all
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
    params.require(:location).permit(:name, :updated_at)
  end
end
