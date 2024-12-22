Rails.application.routes.draw do
  # Root path
  root "cars#index"
  resources :cars do
    resources :maintenance_services
  end

  resource :sessions, only: [ :new, :create, :destroy ]
  resources :users
  get "maintenance_services" => "maintenance_services#index"

  namespace :api do
    namespace :v1 do
      resources :cars
      resources :maintenance_services
    end
  end
end
