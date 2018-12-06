Rails.application.routes.draw do
  resources :games, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  resources :profile, only: [:index, :show, :edit, :update]
  

  get 'dashboards/index', to: 'dashboards#index'
  get '/profil', to: 'profile#edit'
  get 'landing_pages/index'
  root 'landing_pages#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #devise_for :users, controllers: { registrations: 'users/registrations' }  
end