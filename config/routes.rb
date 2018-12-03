Rails.application.routes.draw do
  get 'dashboards/index'
  get 'dashboards/profil'
  get 'landing_pages/index'
  root 'landing_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
