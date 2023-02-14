class ShopParticipantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @shop_participants = policy_scope(ShopParticipant).all
  end
end
