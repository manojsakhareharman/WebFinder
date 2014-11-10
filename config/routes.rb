Rails.application.routes.draw do

  resources :vertical_markets, only: :show
  root to: 'main#index'

end
