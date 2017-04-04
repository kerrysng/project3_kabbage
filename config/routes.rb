Rails.application.routes.draw do

  get 'sessions/new'
  root 'pages#index'

  get '/new', to: 'user#new'
  post '/new', to: 'user#create'

  post '/', to: 'session#create_session'
  delete '/', to: 'session#destroy_session'

  get '/new', to: 'pages#new'
  post '/new', to: 'pages#create_user'
  get '/new_card_form', to: 'pages#new_card_form'


  namespace :api do
    resources :trips , :cards
  end
end
