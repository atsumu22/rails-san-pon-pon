class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :dashboard ]

  def home; end

  def dashboard
    @shops = policy_scope(Shop).last(4)
    @stamp_rallies = policy_scope(StampRally).all
  end
end
