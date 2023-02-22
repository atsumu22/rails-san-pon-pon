class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :dashboard ]

  def home; end

  def dashboard
    @shops = policy_scope(Shop).last(4)
    @stamprallies = policy_scope(StampRally).all
    @participant = current_user
  end
end
