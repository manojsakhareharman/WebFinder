Rails.application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :brands, only: :show do
    member do
      get :softwares
    end
    resources :products, only: [:index, :show]
  end

  resources :vertical_markets, path: 'applications', only: :show do
    resources :reference_systems, path: 'solutions', only: :show
    resources :case_studies, only: :show
  end
  resources :landing_pages, path: 'lp', only: :show
  resources :leads, path: 'plan/help', only: [:new, :create]
  resources :venues, only: :index

  # Consultant Portal
  get '/consultants/software(.:format)' => 'consultants#software', defaults: { format: 'json' }
  get '/consultant' => 'consultants#index', as: :consultant_portal
  get '/consultant-portal', to: redirect('/consultant')
  get '/consultants', to: redirect('/consultant')

  # Service Site
  get '/service' => 'service#index', as: :service
  get '/service_centers/login' => 'service_centers#login', as: :service_center_login
  resources :service_centers, only: [:index, :new, :create]

  # Training site
  get '/training' => 'landing_pages#training'

  # The usual stuff
  get '/contacts' => 'landing_pages#contacts'
  get '/thankyou' => 'landing_pages#thankyou', as: :thankyou # Thank you page after leadgen form
  get '/thanks' => 'landing_pages#thanks', as: :thanks # Generic thanks page
  get '/privacy_policy' => 'landing_pages#privacy_policy', as: :privacy_policy
  get '/terms_of_use' => 'landing_pages#terms_of_use', as: :terms_of_use
  get '/sitemap(.:format)' => 'main#sitemap', as: :sitemap

  root to: 'main#index'

end
