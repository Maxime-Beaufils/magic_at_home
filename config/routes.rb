Rails.application.routes.draw do
  get 'games/index'
  get 'games/edit'
  get 'games/show'
  get 'games/delete'
  get 'games/new'
  get 'dashboards/index', to: 'dashboards#index'
  get '/profil', to: 'dashboards#profil'
  get 'landing_pages/index'
  root 'landing_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
