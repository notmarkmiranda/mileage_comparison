Rails.application.routes.draw do
  root 'pages#index'

  resources :users, except: [:index, :delete]
  resources :logs
end
