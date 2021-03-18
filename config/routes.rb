Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/product', to: 'api/products#create'
  get '/product', to: 'api/products#show'
  get '/products', to: 'api/products#index'
  get '/categories', to: 'api/categories#index'
  get '/profile/products', to: 'api/profile#products'


  root = 'home#index'

  root to: root
  get '/:Warriors', to: root
  get '/:Unforgiven/:Two', to: root
  get '/:Back/:In/:Black', to: root
  get '/:Born/:To/:Be/:Wild', to: root
  get '/:Rock/:To/:Like/:a/:Hurricane', to: root
  get '/:I/:Was/:Made/:For/:Lovin/:You', to: root
end
