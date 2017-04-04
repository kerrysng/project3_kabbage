Rails.application.routes.draw do
<<<<<<< HEAD
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#index'

  post '/', to: 'session#create_session'

  delete '/', to: 'session#destroy_session'

  get '/new', to: 'pages#new'

  post '/new', to: 'pages#create_user'

  get '/new_card_form', to: 'pages#new_card_form'

  # post '/create_card', to: '/apicards#create_card'

  namespace :api do
    resources :cards
  end
=======
  get 'sessions/new'

get '/new', to: 'user#new'
post '/new', to: 'user#create'

get '/login', to: 'session#new'
post '/session', to: 'session#create'
delete '/session', to: 'session#destroy'

namespace :api do
  resources :trips
end
>>>>>>> 1173d87f63a3fb5985cd438f83ddca8da5145f43

end
