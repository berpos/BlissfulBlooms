class PlantsController < ApplicationController

  def index
    @plants = Plant.all
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:name, :state, :updated_at)
  end
end
