class ShopParticipantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @shop_participants = policy_scope(ShopParticipant).all
  end

  def print
    @stamp_rally = StampRally.find(params[:stamp_rally_id])
    @shop_participant = @stamp_rally.shop_participants.find(params[:id])
    @qr_code = RQRCode::QRCode.new(@shop_participant.qr_code)
    @svg = @qr_code.as_svg(
      offset: 20,
      color: '000',
      fill: 'fff',
      shape_rendering: 'crispEdges',
      standalone: true,
      module_size: 30,
    )

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'QR Code',
              layout: 'application',
              page_size: 'A4',
              encording: 'UTF-8',
              show_as_html: params[:debug].present?,
              margin: { top: 3, bottom: 3, left: 3, right: 3 }
      end
    end
    authorize @shop_participant
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
