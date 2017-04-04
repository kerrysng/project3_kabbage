Rails.application.routes.draw do

  get 'sessions/new'
  root 'pages#index'

  get 'users/new', to: 'users#new'
  post '/new', to: 'users#create'

  post '/', to: 'session#create_session'
  delete '/', to: 'session#destroy_session'

  get '/new', to: 'users#new'
  post '/new', to: 'users#create_user'
  get '/new_card_form', to: 'pages#new_card_form'

  get '/dashboard', to: 'pages#dashboard'


  namespace :api do
    resources :trips , :cards
  end

end
