Rails.application.routes.draw do

  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get '/new', to: 'user#new'
post '/new', to: 'user#create'

get '/login', to: 'session#new'
post '/session', to: 'session#create'
delete '/session', to: 'session#destroy'

get '/cards', to: 'cards#index'
get '/cards/new', to: 'cards#new' #new is method for getting a form

post '/cards', to: 'cards#create'
delete '/cards', to: 'cards#destroy'
get '/cards/:id', to: 'cards#show'

namespace :api do
  resources :trips
end

end
