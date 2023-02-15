# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"

  #stamp cards are nested inside of the participating shops because we need to identify the specific shop in order to give the correct shop its stamp ---> one stamp belongs to one shop
  resources :shop_participants, only: %i[index] do
    resources :stamp_cards, only: %i[show new create]
  end
  resources :stamp_rallies, only: %i[index show new create]
  resources :shops, only: %i[index show new create]
  resources :stamp_cards, only: %i[index]
end
