class LogsController < ApplicationController
  # before_action :set_logs, only: %i[edit update]

  def edit
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
    params.require(:log).permit(:content, :categories)
  end
end
