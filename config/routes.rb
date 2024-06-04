Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "location/:id/plants", to: "plants#plantslocation"

  get "homepage", to: "locations#recentlocations"

  resources :locations do

  end
end
