class LogsController < ApplicationController
  before_action :set_logs, only: %i[edit]

  def edit
  end

  def update

  end

  private

  def set_logs
    @log = Log.find(params[:id])
  end

  def log_params
    params.require(:log).permit(:content, :categories)
  end
end
