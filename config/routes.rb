Rails.application.routes.draw do
  resources :gardens do
    resources :plants, only: :create
  end
  # WE NEED TO KNOW THE ID OF THE PARENT
  resources :plants, only: :destroy do
    resources :plant_tags, only: [:new, :create]
  end
end
