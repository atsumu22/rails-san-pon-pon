class ShopsController < ApplicationController
  before_action :set_shop, only: %i[show]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @shops = policy_scope(Shop).all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @shops.geocoded.map do |shop|
      {
        lat: shop.latitude,
        lng: shop.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { shop: shop })
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
    params.require(:shop).permit(:name, :address, :category, :description, :photo)
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end

  # def create
  # end

end
