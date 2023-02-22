class StampCardsController < ApplicationController
  before_action :set_stamp_rally, only: %i[new create]
  def index
    @stamp_cards = policy_scope(StampCard)
    #need to restrict the items to show....
    # only the list of StampCard.participant_id == params[:participant_id] || StampCard.participant.stamp_rally_id == params[:stamp_rally_id]
  end

  def show
    @stamp_card = StampCard.find(params[:id])
    authorize @stamp_card
  end

  def new
    @stamp_card = StampCard.new
    authorize @stamp_card
  end

  def create
    @participant_myself = Participant.where(user: current_user, stamp_rally: @stamp_rally).last
    @stamp_card = StampCard.new(participant: @participant_myself, stamp_rally: @stamp_rally)
    authorize @stamp_card
    if @stamp_card.save
      redirect_to stamp_rally_participant_stamp_card_path(@stamp_rally, @participant_myself, @stamp_card)
    end
    # @stamp_card = StampCard.new(stamp_card_params)
    # # @stamp_card.participant = @participant
    # authorize @stamp_card
    # if @stamp_card.save
    #   redirect_to shop_participant_stamp_card_path(@stamp_card)
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  private

  def set_stamp_rally
    @stamp_rally = StampRally.find(params[:stamp_rally_id])
  end
end
