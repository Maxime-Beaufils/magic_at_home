Rails.application.routes.draw do
  resources :games, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  get 'dashboards/index', to: 'dashboards#index'
    get 'dashboards/log', to: 'dashboards#log'
  get '/profil', to: 'dashboards#profil'
  get 'landing_pages/index'
  root 'landing_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

end
