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
end
