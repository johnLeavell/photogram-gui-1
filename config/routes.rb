Rails.application.routes.draw do

  get '/users', to: 'users#index'
  post '/add_user', to: 'users#add_user'
end
