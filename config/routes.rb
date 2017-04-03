Rails.application.routes.draw do
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get '/signup', to: 'user#new'
post '/user', to: 'user#create'

get '/login', to: 'session#new'
post '/session', to: 'session#create'
delete '/session', to: 'session#destroy'


end
