Rails.application.routes.draw do
  devise_for :users
  root to: "locations#recentlocations"
  get "location/:id/plants", to: "plants#plantslocation"
  get "homepage", to: "locations#recentlocations"
  get "profile", to: "users#profile"
  get "location/:id/edit", to: "logs#edit", as: :edit
  patch "location/:id", to: "logs#update"
  get "logs", to: "logs#show"

  resources :locations do
    resources :plants, only: %i[new create]
  end

  resources :plants, except: %i[new create]  do
    resources :logs, only: %i[new create]
  end
end
