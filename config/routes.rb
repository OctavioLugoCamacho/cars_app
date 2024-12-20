Rails.application.routes.draw do
  # Root path
  root "cars#index"
  resources :cars do
    resources :maintenance_services
  end

  get "maintenance_services" => "maintenance_services#index"
end
