Rails.application.routes.draw do
  root to: 'pages#index'
mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :pages
  resources :shows
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
