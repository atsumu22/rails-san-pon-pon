class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization

  # Pundit: allow-list approach
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def after_sign_in_path_for(resource)
    if current_user.status == "chairperson"
      dashboard_path
    else
      stamp_rallies_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def default_url_options
    { host: ENV["https://www.sampompom.team"] || "localhost:3000" }
  end

end
