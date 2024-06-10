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
      # @plant.leveling # DOES THIS MAKE SENSE?
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def leveling # HOW TO MAKE THIS WORK
  #   log_count = logs.count

  #   if log_count.zero?
  #     @plant.level = 0
  #   elsif log_count == 4
  #     @plant.level = 1
  #   elsif (log_count >= 8) && (log_count <= 12)
  #     @plant.level = 2
  #   else
  #     @plant.level = 3
  #   end
  # end

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
    #@log = @plant.logs.build(log_params) # Do i need this?

    if @log.save
      #@plant.leveling
      redirect_to location_path(@location)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
