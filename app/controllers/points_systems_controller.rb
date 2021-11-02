class PointsSystemsController < ApplicationController
  def index
    @points_systems = PointsSystem.all
  end

  def new
    @points_system = PointsSystem.new
  end

  def create
    @points_system = PointsSystem.create(points_system_params)
    if @points_system.valid?
      redirect_to points_systems_path
    else
      flash[:alert] = @points_system.errors.full_messages
      redirect_to new_points_system_path
    end
  end

  private

  def points_system_params
    params.require(:points_system).permit(:name, positions_tables_attributes: [:points, :position])
  end
end