# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"

  #stamp cards are nested inside of the participating shops because we need to identify the specific shop in order to give the correct shop its stamp ---> one stamp belongs to one shop

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
      resources :stamp_cards, only: %i[index show new create] do
        resources :shop_participants, only: %i[index] do
          member do
            post :stamped
          end
        end
      end
    end
  end
  resources :shops, only: %i[index show new create]
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
