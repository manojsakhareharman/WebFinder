Rails.application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Trying out upmin...
  authenticate :admin_user do
    mount Upmin::Engine => '/upmin'
  end

  resources :brands, only: :show
  resources :vertical_markets, path: 'applications', only: :show do
    resources :reference_systems, path: 'solutions', only: :show
    resources :case_studies, only: :show
  end
  resources :leads, path: 'plan/help', only: [:new, :create]

  get 'thankyou' => 'main#thankyou', as: :thankyou
  root to: 'main#index'

end
