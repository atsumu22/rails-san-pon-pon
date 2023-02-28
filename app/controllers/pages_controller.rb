class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :dashboard ]

  def home; end

  def dashboard
    if user_signed_in?
      if current_user.status == "chairperson"
        @shops = policy_scope(Shop).where(user_id: current_user).last(4)
      end
    end

    # Only shows the ongoing and coming soon stamp rallies
    @stamprallies = policy_scope(StampRally).where("CURRENT_DATE BETWEEN start_date AND end_date
      OR CURRENT_DATE < start_date")
    @participant = current_user
  end
end
