class StampRalliesController < ApplicationController
  before_action :set_stamp_rally, only: %i[show print]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @stamp_rallies = policy_scope(StampRally).all
  end

  def show
    @participant = Participant.new
    @qr_hash = {}
    @stamp_rally.shop_participants.each do |shop_participant|
      qr_code = RQRCode::QRCode.new(shop_participant.qr_code)
      svg = qr_code.as_svg(
        offset: 20,
        color: '000',
        fill: 'fff',
        shape_rendering: 'crispEdges',
        standalone: true,
        module_size: 12,
      )
      @qr_hash[shop_participant] = svg
    end
    authorize @stamp_rally
  end

  def new
    @stamp_rally = StampRally.new
    @shops = Shop.where(user: current_user)
    authorize @stamp_rally
  end

  def create
    @stamp_rally = StampRally.new(stamp_rally_params)
    @stamp_rally.user = current_user
    # to use each_with_index is better
    @stamp_rally.attend_shops.delete("")
    @attend_shops_id = @stamp_rally.attend_shops.map { |attend_shop_num| attend_shop_num.to_i }
    @attend_shops_id.each do |id|
      shop = Shop.find(id)
      shop_participant = ShopParticipant.new(shop: shop)
      shop_participant.stamp_rally = @stamp_rally
      shop_participant.save
      shop_participant.update!(qr_code: "#{shop_participant.id}/stamped")
    end
    authorize @stamp_rally
    if @stamp_rally.save
      redirect_to stamp_rally_path(@stamp_rally)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_stamp_rally
    @stamp_rally = StampRally.find(params[:id])
  end

  def stamp_rally_params
    params.require(:stamp_rally).permit(:name, :description, :start_date, :end_date, {:attend_shops => []})
  end
end
