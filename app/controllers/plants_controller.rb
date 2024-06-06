class PlantsController < ApplicationController

  def index
    # last_update = time_ago_in_words(params[:updated_at])
    @plants = Plant.all
    # @last_update = last_update.days_ago
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:name, :state, :updated_at)
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.location = @location
    if @plant.save
      redirect_to location_path(@location)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_location
    @location = Location.find(params[:location_id])
  end

  def plant_params
    params.require(:plant).permit(:name)
  end
end
