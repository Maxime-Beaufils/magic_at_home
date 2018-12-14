Rails.application.routes.draw do

  get 'events/show'
  root 'landing_pages#index'
  get 'landing_pages/index'
  get '/yolo', to: 'landing_pages#yolo'


  resources :games, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :game_comments
  end

  post 'games/:id', to: 'games#join_game'

  resources :profile, only: [:index, :show, :edit, :update]
  get '/player', to: 'profile#index'
  get '/profil', to: 'profile#edit'
  patch '/profil', to: 'profile#update'

  get '/map', to: 'dashboards#map'

  resources :events

  devise_for :users,
                    controllers: {
                                    confirmations: 'users/confirmations' ,
                                    omniauth_callbacks: "users/omniauth_callbacks" ,
                                    passwords: 'users/passwords' ,
                                    registrations: 'users/registrations' ,
                                    sessions: 'users/sessions' ,
                                    unlocks: 'users/unlocks' }
end
