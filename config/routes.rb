Rails.application.routes.draw do
  root 'pages#index'

  resources :users, except: [:index, :show, :delete]
  resources :logs

  get '/dashboard', to: 'users#show', as: 'dashboard'

  get '/auth/:provider/callback', to: 'sessions#create'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/token_exchange', to: 'token#create', as: 'token_exchange'

  mount ActionCable.server, at: '/cable'
end
