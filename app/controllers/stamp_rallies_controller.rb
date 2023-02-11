class StampRalliesController < ApplicationController

  before_action :set_stamp_rally, only: %i[show]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @stamp_rallies = policy_scope(StampRally).all
  end

  def show
    authorize @stamp_rally
  end

  def new
    @stamp_rally = StampRally.new
    authorize @stamp_rally
  end

  def create
    @stamp_rally = StampRally.new(stamp_rally_params)
    @stamp_rally.user = current_user
    authorize @stamp_rally
    if @stamp_rally.save
      redirect_to stamp_rally_path(@stamp_rally)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_stamp_rally
    @stamp_rally = StampRally.find(params[:id])
  end

  def stamp_rally_params
    params.require(:stamp_rally).permit(:name, :description, :start_date, :end_date)
  end
  
end
