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
  patch '/api/user', to: 'api/users#update'
  get '/api/user', to: 'api/users#show'
  delete '/product', to: 'api/products#delete'
  get '/api/user_profile', to: 'api/users#user_profile'
  get '/profile/user_products', to: 'api/profile#user_products'
  post '/comments', to: 'api/comments#create'
  delete '/comments', to: 'api/comments#destroy'
  put '/comments', to: 'api/comments#update'
  get 'product/wanna_thing', to: 'api/products#wanna_thing'
  get '/product/thing_to_change', to: 'api/products#thing_to_change'

  get '/notifications', to: 'api/notifications#index'
  get '/notifications/update', to: 'api/notifications#update'

  post '/telegram_webhook', to: 'api/telegram#telegram_webhook'

  root = 'home#index'

  root to: root
  get '/:Warriors', to: root
  get '/:Unforgiven/:Two', to: root
  get '/:Back/:In/:Black', to: root
  get '/:Born/:To/:Be/:Wild', to: root
  get '/:Rock/:To/:Like/:a/:Hurricane', to: root
  get '/:I/:Was/:Made/:For/:Lovin/:You', to: root
end
