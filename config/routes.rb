Rails.application.routes.draw do
  resources :games, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  resources :profile, only: [:index, :show, :edit, :update]
  

  get 'dashboards/index', to: 'dashboards#index'
  get '/profil', to: 'profile#edit'
  patch '/profil', to: 'profile#update'
  get 'landing_pages/index'
  root 'landing_pages#index'


  devise_for :users, 
                    controllers: {
                                    confirmations: 'users/confirmations' ,
                                    omniauth_callbacks: "users/omniauth_callbacks" ,
                                    passwords: 'users/passwords' ,
                                    registrations: 'users/registrations' ,
                                    sessions: 'users/sessions' ,
                                    unlocks: 'users/unlocks' }
end