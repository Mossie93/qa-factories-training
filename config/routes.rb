Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  resources :birds do
    resources :user_photos, only: [:new, :create, :destroy]
  end

  resources :countries do
    resources :regions, except: [:index]
    resources :environmental_laws, except: [:index]
  end
end
