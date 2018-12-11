Rails.application.routes.draw do

  root 'landing_pages#index'
  get 'landing_pages/index'

<<<<<<< HEAD
  resources :games, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :game_comments
  end
=======
  resources :games, only: [:index, :new, :create, :show, :edit, :update, :destroy]
>>>>>>> front_users
  post 'games/:id', to: 'games#join_game'

  resources :profile, only: [:index, :show, :edit, :update]
  get '/player', to: 'profile#index'
  get '/profil', to: 'profile#edit'
  patch '/profil', to: 'profile#update'
  
  get '/map', to: 'dashboards#map'


  devise_for :users, 
                    controllers: {
                                    confirmations: 'users/confirmations' ,
                                    omniauth_callbacks: "users/omniauth_callbacks" ,
                                    passwords: 'users/passwords' ,
                                    registrations: 'users/registrations' ,
                                    sessions: 'users/sessions' ,
                                    unlocks: 'users/unlocks' }
end
