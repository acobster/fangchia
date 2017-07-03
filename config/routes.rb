Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'pages#index'

  get '/shows', to: 'shows#index'
  get '/shows/:slug', to: 'shows#show'

  get '/:slug', to: 'pages#show'

  devise_for :users
end
