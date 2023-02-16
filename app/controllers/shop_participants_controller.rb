class ShopParticipantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @shop_participants = policy_scope(ShopParticipant).all
  end

  def stamped
    # @participant = Paticipant.find(params[:participant_id])
    @stamp_card = StampCard.find(params[:stamp_card_id])
    @shop_participant = ShopParticipant.find(params[:id])
    @stamp_card.shop_participant = @shop_participant
    authorize @shop_participant
    @shop_participant.stamped!
    redirect_to stamp_card_path(@stamp_card)
  end
end
