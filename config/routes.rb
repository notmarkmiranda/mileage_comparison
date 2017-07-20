Rails.application.routes.draw do
  root 'pages#index'

  resources :users, except: [:index, :delete]
  resources :logs

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
