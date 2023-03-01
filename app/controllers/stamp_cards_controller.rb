class StampCardsController < ApplicationController
  before_action :set_stamp_rally, only: %i[show map_view new create get_reward]
  def index
    @stamp_cards = policy_scope(StampCard).all
    participants = Participant.where(user: current_user)
    @rewards = {}
    participants.each do |participant|
      @rewards[participant.stamp_rally] = StampCard.where(participant: participant).first.reward_status
    end

    # need to restrict the items to show....only the list
    # StampCard.participant_id == params[:participant_id] || StampCard.participant.stamp_rally_id == params[:stamp_rally_id]
  end

  def show
    @participant = Participant.find(params[:participant_id])
    @stamp_card = StampCard.find(params[:id])
    authorize @stamp_card
  end

  def map_view
    @participant = Participant.find(params[:participant_id])
    @stamp_card = StampCard.find(params[:id])
    # getting markers to generate lat and lon for each SHOP PARTICIPANT
    @markers = @stamp_card.stamp_rally.shop_participants.geocoded.map do |shop|
      {
        lat: shop.latitude,
        lng: shop.longitude,
        map_view_info_window_html: render_to_string(partial: "map_view_info_window", locals: {shop: shop}),
        map_view_marker_html: render_to_string(partial: "map_view_marker", locals: {shop: shop})      }
    end

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
    @stamp_rally.shop_participants.each do |shop_participant|
      @stamp_card.shops_status[shop_participant.id] = "unstamped"
    end
    authorize @stamp_card
    @stamp_card.save
    redirect_to stamp_rally_participant_stamp_card_path(@stamp_rally, @participant, @stamp_card)
  end

  def get_reward
    @participant = Participant.find(params[:participant_id])
    @stamp_card = StampCard.find(params[:id])
    @stamp_card.reward_status = "acquired"
    authorize @stamp_card
    @stamp_card.save
    redirect_to stamp_cards_path
  end

  private

  def set_stamp_rally
    @stamp_rally = StampRally.find(params[:stamp_rally_id])
  end
end
