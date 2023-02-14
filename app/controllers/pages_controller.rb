class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :dashboard ]

  def dashboard
    @shops = policy_scope(Shop).last(4)
  end
end
