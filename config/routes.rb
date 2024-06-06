Rails.application.routes.draw do
  devise_for :users
  root to: "locations#recentlocations"
  get "location/:id/plants", to: "plants#plantslocation"
  get "homepage", to: "locations#recentlocations"
  get "profile", to: "users#profile"
  get "logs", to: "logs#show"

  resources :locations do
  end

  resources :plants do
  end
end
