Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :vertical_markets, path: 'applications', only: :show do
    resources :reference_systems, path: 'solutions', only: :show
    resources :case_studies, only: :show
  end

  root to: 'main#index'

end
