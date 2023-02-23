class StampCardsController < ApplicationController
  before_action :set_stamp_rally, only: %i[new create]
  def index
    @stamp_cards = policy_scope(StampCard)
    #need to restrict the items to show....
    # only the list of StampCard.participant_id == params[:participant_id] || StampCard.participant.stamp_rally_id == params[:stamp_rally_id]
  end

  def show
    @participant = Participant.find(params[:participant_id])
    @stamp_card = StampCard.find(params[:participant_id])
    authorize @stamp_card
  end

  def new
    @participant = Participant.new
    @stamp_card = StampCard.new
    authorize @stamp_card
  end

  def create
    @participant = Participant.find(params[:participant_id])
    @stamp_card = StampCard.new(participant: @participant, stamp_rally: @stamp_rally)
    authorize @stamp_card
    @stamp_card.save
    redirect_to stamp_rally_participant_stamp_card_path(@stamp_rally, @participant, @stamp_card)
  end

  private

  def set_stamp_rally
    @stamp_rally = StampRally.find(params[:stamp_rally_id])
  end
end
