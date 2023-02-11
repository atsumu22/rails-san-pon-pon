class ShopsController < ApplicationController

  # def index
  # end

  def new
    @shop = Shop.new
  end
end
