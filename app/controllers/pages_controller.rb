class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :dashboard ]

  def home; end

  def dashboard
    if user_signed_in?
      if current_user.status == "chairperson"
        @shops = policy_scope(Shop).where(user_id: current_user).last(4)
      end
    end
    @stamprallies = policy_scope(StampRally).all
    @participant = current_user
  end
end
