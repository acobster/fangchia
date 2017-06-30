Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'pages#index'

  get '/shows', to: 'shows#index'
  get '/shows/:slug', to: 'shows#show'

  get '/:slug', to: 'pages#show'

  devise_for :users
end
