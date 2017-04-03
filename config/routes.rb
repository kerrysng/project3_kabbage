Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#index'

  post '/', to: 'session#create_session'

  delete '/', to: 'session#destroy_session'

  get '/new', to: 'pages#new'

  post '/new', to: 'pages#create_user'


end
