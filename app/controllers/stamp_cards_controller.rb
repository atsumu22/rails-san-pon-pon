class StampCardsController < ApplicationController
  before_action :set_shop_participant, only: %i[new create]

  def new
    @stamp_card = StampCard.new
    authorize @stamp_card
  end

  def create
    @stamp_card = StampCard.new
    @stamp_card.shop_participant = @shop_participant
    authorize @stamp_card
    if @stamp_card.save
      redirect_to stamp_card_path(@stamp_card)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_shop_participant
    @shop_participant = ShopParticipant.find(params[:shop_participant_id])
  end
end
