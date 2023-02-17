class StampCardsController < ApplicationController
  before_action :set_shop_participant, only: %i[show new create print]

  def show
    @stamp_card = StampCard.find(params[:id])
    @stamp_card.shop_participant = @shop_participant
    @qr_code = RQRCode::QRCode.new(@stamp_card.qr_code)
    @svg = @qr_code.as_svg(
      offset: 20,
      color: '000',
      fill: 'fff',
      shape_rendering: 'crispEdges',
      standalone: true,
      module_size: 12,
    )
    authorize @stamp_card
  end

  def new
    @stamp_card = StampCard.new
    authorize @stamp_card
  end

  def create
    @stamp_card = StampCard.new(stamp_card_params)
    @stamp_card.shop_participant = @shop_participant
    authorize @stamp_card

    if @stamp_card.save
      redirect_to shop_participant_stamp_card_path(@shop_participant, @stamp_card)
    else
      render :new, status: :unprocessable_entity
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

  def print
    @stamp_card = StampCard.find(params[:id])
    @stamp_card.shop_participant = @shop_participant
    @qr_code = RQRCode::QRCode.new(@stamp_card.qr_code)
    @svg = @qr_code.as_svg(
      offset: 20,
      color: '000',
      fill: 'fff',
      shape_rendering: 'crispEdges',
      standalone: true,
      module_size: 24
    )
    authorize @stamp_card

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@shop_participant.shop.name}",
               layout: 'application',
               page_size: 'A4',
               encording: 'UTF-8',
               show_as_html: params[:debug].present?,
               margin: { top: 3, bottom: 3, left: 3, right: 3 }
      end
    end
  end

  private

  def set_shop_participant
    @shop_participant = ShopParticipant.find(params[:shop_participant_id])
  end

  def stamp_card_params
    params.require(:stamp_card).permit(:qr_code)
  end
end
