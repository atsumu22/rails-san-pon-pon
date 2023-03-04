class ShopsController < ApplicationController
  before_action :set_shop, only: %i[show]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @shops = policy_scope(Shop).where(user_id: current_user)
    # The `geocoded` scope filters only flats with coordinates
    @markers = @shops.geocoded.map do |shop|
      {
        lat: shop.latitude,
        lng: shop.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { shop: shop }),
        shop_marker_html: render_to_string(partial: "shop_marker", locals: { shop: shop })
      }
    end
  end

  def show
    authorize @shop
  end

  def new
    @shop = Shop.new
    authorize @shop
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user = current_user
    case @shop.category
    when "Shop" then @shop.category_icon = "baiten"
    when "Izakaya" then @shop.category_icon = "izakaya"
    when "Sushi" then @shop.category_icon = "kaiten-zushi"
    when "Curry" then @shop.category_icon = "kare-raisu"
    when "Kimono" then @shop.category_icon = "kimono"
    when "Coffee" then @shop.category_icon = "kissaten"
    when "Ramen" then @shop.category_icon = "ramen"
    when "Restaurant" then @shop.category_icon = "resutoran"
    when "Karaoke" then @shop.category_icon = "karaoke"
    end
    authorize @shop
    if @shop.save
      redirect_to shop_path(@shop)
    else
      render shops_path, status: :unprocessable_entity
    end
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :address, :category, :description, :photo, :category_icon, :profile_photo, :profile_description)
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end
end
