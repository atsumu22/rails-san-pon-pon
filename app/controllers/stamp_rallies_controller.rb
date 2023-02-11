class StampRalliesController < ApplicationController

  # def show
  #   @stamp_rally = StampRally.new
  # end

  def new
    @stamp_rally = StampRally.new
  end

  def create
    @stamp_rally = StampRally.new(stamp_rally_params)
  end



  private

  def stamp_rally_params
    params.require(:stamp_rally).permit(:name, :description, :start_date, :end_date)
  end
end
