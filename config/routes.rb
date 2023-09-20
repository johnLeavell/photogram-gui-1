Rails.application.routes.draw do
  get '/', to: 'users#index'
  get '/users', to: 'users#index'
  get '/users/:username', to: 'users#show'
  post '/update_user/:id', to: 'users#update'
  post '/add_user', to: 'users#add_user'

  get '/photos', to: 'photos#index'
  post '/insert_photo_record', to: 'photos#create'
  get '/photos/:id', to: 'photos#show'
  post '/update_photo/:id', to: 'photos#update'
  get '/delete_photo/:id', to: 'photos#destroy'
end
