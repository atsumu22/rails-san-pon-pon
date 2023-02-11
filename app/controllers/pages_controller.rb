class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :dashboard ]

  def dashboard
    @shops = Shop.last(4)
  end
end
