class ShopParticipantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @shop_participants = policy_scope(ShopParticipant).all
  end

  def stamped
    @stamp_card = StampCard.find(params[:id])
    @stamped = @stamp_card.shop_participant.status = "stamped"
  end
end
