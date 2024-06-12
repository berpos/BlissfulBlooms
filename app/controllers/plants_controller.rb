class PlantsController < ApplicationController
  before_action :set_location, only: %i[new create]
  def index
    @plants = current_user.plants
    @plants.each(&:check_state)
  end

  def new
    @plant = Plant.new
    @log = Log.new
  end

  def create
    @plant = Plant.new(name: plant_params.dig(:name), categories: plant_params.dig(:categories))
    @plant.location = @location

    if @plant.save
      create_log
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_location
    @location = Location.find(params[:location_id])
  end

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:name, :categories, log: {})
  end

  def create_log
    @log = Log.new(content: params["plant"]["log"]["content"])
    @log.plant = @plant
    @log.categories = "healthy"


    if @log.save
      redirect_to location_path(@location)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
