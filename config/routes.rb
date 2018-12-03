Rails.application.routes.draw do
  get 'dashboards/index', to: 'dashboard#index'
  get 'dashboards/profil', to: 'dashboard#profil'
  get 'landing_pages/index'
  root 'landing_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
