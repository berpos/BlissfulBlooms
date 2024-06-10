class PlantsController < ApplicationController
  before_action :set_location, only: %i[new create]
  def index
    @plants = Plant.all
  end

  def new
    @plant = Plant.new
    @log = Log.new
  end

  def create
    @plant = Plant.new(plant_params)
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
    params.require(:plant).permit(:name, :categories, logs_attributes: [:content])
  end

  def log_params
    params.require(:plant).permit(log_attributes: [:content])
  end

  def create_log
    @log = Log.new(content: params["plant"]["log"]["content"])
    @log.plant = @plant

    if @log.save
      redirect_to location_path(@location)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
