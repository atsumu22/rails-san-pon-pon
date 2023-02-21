class StampCardsController < ApplicationController
  before_action :set_stamp_rally, only: %i[new create]
  def index
    @stamp_cards = policy_scope(StampCard)
    #need to restrict the items to show....
    # only the list of StampCard.participant_id == params[:participant_id] || StampCard.participant.stamp_rally_id == params[:stamp_rally_id]
  end

  def new
    @stamp_card = StampCard.new
    authorize @stamp_card
  end

  def create
    @participant = Participant.create(participant_params)
    @stamp_rally = StampRally.find(params[:stamp_rally_id])
    @participant = Participant.create(user: current_user, stamp_rally: @stamp_rally)
    @stamp_card = StampCard.new(participant: @participant)
    @stamp_card.save
    @stamp_rally.shop_participants.each do |shop_participant|
      @stamp_card.update!(shop_participant: shop_participant)
    end
    authorize @stamp_card

    redirect_to stamp_rally_participant_stamp_cards_path
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

  def participant_params
    params.require(:participant).permit(:user)
  end
end
