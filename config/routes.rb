Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  # Cars routes
  root "cars#index"
  get "cars" => "cars#index"
end
