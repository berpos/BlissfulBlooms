Rails.application.routes.draw do
  devise_for :users
  root to: "locations#recentlocations"
  get "location/:id/plants", to: "plants#plantslocation"
  get "homepage", to: "locations#recentlocations"

  resources :locations do
    resources :plants, only: %i[new create]
  end
end
