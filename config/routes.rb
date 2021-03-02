Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/product', to: 'api/products#create'
  get '/products', to: 'api/products#index'
  get '/categories', to: 'api/categories#index'
end
