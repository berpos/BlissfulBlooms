class LogsController < ApplicationController
  before_action :set_plant, only: %i[create new]
  #before_action :set_logs, only: %i[create]

  def new
    @log = Log.new
    @location = @plant.location
  end

  def create
    @log = Log.new(log_params)
    @log.plant = @plant
    @location = @plant.location
    if @log.save
      redirect_to location_path(@location), notice: "Log was successfully updated."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @log.plant = @plant
    if @log.update(log_params)
      redirect_to log_path(@log), notice: "Log was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_logs
    @log = Log.find(params[:id])
  end

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end

  def log_params
    params.require(:log).permit(:content, :categories)
  end
end
