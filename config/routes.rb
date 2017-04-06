Rails.application.routes.draw do

  get '/', to: 'pages#index'

  get 'sessions/new'
  # root 'pages#index'

  get '/user', to: 'users#index'
  post '/user/new', to: 'users#create'

  get '/user/edit', to: 'users#edit'
  patch '/user/update', to: 'users#update'

  post '/', to: 'session#create_session'
  delete '/', to: 'session#destroy_session'

  get '/dashboard', to: 'pages#dashboard'
  get '/mood_board', to: 'pages#mood_board'

  get '/trip/:id', to: 'pages#trip_view'

  get '/new_trip', to: 'pages#new_trip'

  namespace :api do
    resources :trips , :cards, :moods
  end

end
