class ShopParticipantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @stamp_rally = StampRally.find(params[:stamp_rally_id])
    @shop_participants = policy_scope(ShopParticipant).where(stamp_rally_id: @stamp_rally)
    @participant = current_user.participants.where(stamp_rally_id: @stamp_rally)
    @markers = @shop_participants.geocoded.map do |shop_participant|
      {
        lat: shop_participant.latitude,
        lng: shop_participant.longitude,
        wide_map_info_window_html: render_to_string(partial: "wide_map_info_window", locals: { shop_participant: shop_participant }),
        marker_html: render_to_string(partial: "marker", locals: { shop_participant: shop_participant })
      }
    end
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
      module_size: 16,
    )

    respond_to do |format|
      format.html
      format.pdf do
        render  pdf: 'QR Code',
                layout: 'application',
                page_size: 'A4',
                encording: 'UTF-8',
                no_background: false,
                show_as_html: params[:debug].present?,
                margin: { top: 3, bottom: 3, left: 3, right: 3 }
      end
    end
    authorize @shop_participant
  end

  def stamped
    @shop_participant = ShopParticipant.find(params[:id])
    authorize @shop_participant
    @stamp_rally = @shop_participant.stamp_rally
    @participant = Participant.where(user: current_user, stamp_rally: @stamp_rally).first
    @stamp_card = StampCard.where(participant: @participant, stamp_rally: @stamp_rally).first
    @stamp_card.shops_status[@shop_participant.id] = "stamped"
    shops_status = @stamp_card.shops_status
    collected_stamps = shops_status.select { |_, v| v == "stamped" }.length
    all_stamps = @stamp_card.stamp_rally.shop_participants.count
    if collected_stamps == all_stamps
      @stamp_card.status = "completed"
    end
    @stamp_card.save
    flash_icons
    flash_shop_name
    flash_bg_image
    # changed redirect using Javascript - JS QR scanner Controller
    # redirect_to stamp_rally_participant_stamp_card_path(@stamp_rally, @participant, @stamp_card), status: 303
    respond_to do |format|
      format.html { redirect_to stamp_rally_participant_stamp_card_path(@stamp_rally, @participant, @stamp_card) }
      format.json { render json: { url: stamp_rally_participant_stamp_card_path(@stamp_rally, @participant, @stamp_card) } }
      # format.json
      # Follow the classic Rails flow and look for a create.json view
    end
  end

  private

  def flash_icons
    flash[:category_icon] = @shop_participant.shop.category_icon
  end

  def flash_shop_name
    flash[:shop_name] = @shop_participant.shop.name
  end

  def flash_bg_image
    if @shop_participant.shop.photo.present?
      flash[:bg_image] = @shop_participant.shop.photo.key
    else
      flash[:bg_image] = "https://images.unsplash.com/photo-1478720568477-152d9b164e26?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80"
    end
  end
end
