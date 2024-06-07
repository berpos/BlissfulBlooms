class LogsController < ApplicationController
  before_action :set_logs, only: %i[new create]

  def new
    @log = Log.new
  end

  def create
    @log = Logs.new(log_params)
    @log.plant = @plant
    if @log.save
      redirect_to location_path(@location)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @log.update(log_params)
      redirect_to log_path(@log), notice: "Walker was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_logs
    @log = Log.find(params[:id])
  end

  def log_params
    params.require(:log).permit(:content)
  end
end
