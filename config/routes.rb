Rails.application.routes.draw do

  get 'sessions/new'
  root 'pages#index'

  get '/user', to: 'users#index'
  post '/user/new', to: 'users#create'

  post '/', to: 'session#create_session'
  delete '/', to: 'session#destroy_session'

  get '/new_card_form', to: 'cards#new_card_form'

  get '/dashboard', to: 'pages#dashboard'
  get '/mood_board', to: 'pages#mood_board'

  get '/trip1', to: 'pages#trip_view'

  namespace :api do
    resources :trips , :cards
  end

end
