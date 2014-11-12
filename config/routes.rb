Rails.application.routes.draw do

  get 'examples/show'

  resources :vertical_markets, only: :show do
    resources :examples, only: :show
  end

  root to: 'main#index'

end
