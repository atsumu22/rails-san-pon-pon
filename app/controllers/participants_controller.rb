class ParticipantsController < ApplicationController
  before_action :set_stamp_rally, only: %i[new create]

  def new
    @participant = Participant.new
    authorize @participant
  end

  def create
    @participant = Participant.new(user: current_user)
    @participant.stamp_rally = @stamp_rally
    authorize @participant
    @participant.save
    # no need to redirect anywhere
    # redirect_to stamp_rally_path(@stamp_rally)
  end

  private

  def set_stamp_rally
    @stamp_rally = StampRally.find(params[:stamp_rally_id])
  end

  def participant_params
    params.require(:participant).permit(:user)
  end
end
