# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"
  # added a new route for QR Scanning Feature
  get "qr_codes_scanner", to: "participants#qr_codes_scanner"

  # stamp cards are nested inside of the participating shops because we need to identify
  # the specific shop in order to give the correct shop its stamp ---> one stamp belongs to one shop

  # chairperson's user journey
  resources :stamp_rallies, only: %i[index show new create] do
    resources :shop_participants, only: %i[index] do
      member do
        get :print
      end
    end
  end

  # participant's user journey
  resources :stamp_rallies, only: %i[index show] do
    resources :participants, only: %i[new create] do
      resources :stamp_cards, only: %i[show new create] do
        member do
          get :map_view
          get :get_reward, :use_ticket
          put :get_reward, :use_ticket
        end
      end
    end
  end
  resources :stamp_cards, only: %i[index]
  # I think we don't need this resource already BUT leaving it just in case...
  resources :shop_participants, only: %i[index] do
    # is this the map view...?
    member do
      get :stamped
      put :stamped
    end
  end

  resources :shops, only: %i[index show new create]
  resources :users, only: %i[edit update]
end

# GET and POST  for ShopParticipant#stamped
# ==========previous reoutes================
# resources :shop_participants, only: %i[index] do
#   member do
#     post :stamped
#   end
#   resources :stamp_cards, only: %i[show new create] do
#     member do
#       get :print
#     end
#   end
# end
