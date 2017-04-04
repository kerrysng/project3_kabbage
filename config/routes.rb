Rails.application.routes.draw do
  get 'sessions/new'

get '/new', to: 'user#new'
post '/new', to: 'user#create'

get '/login', to: 'session#new'
post '/session', to: 'session#create'
delete '/session', to: 'session#destroy'

namespace :api do
  resources :trips
end

end
