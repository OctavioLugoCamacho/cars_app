Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  # Root path
  root "cars#index"
  # Cars routes
  get "cars" => "cars#index"
  get "cars/:id" => "cars#show", as: "car"
end
