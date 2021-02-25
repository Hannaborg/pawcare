Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  resources :dogs, only: %i[ index show new create destroy ] do
    resources :bookings, only: %i[ new index show create destroy]
  end
resources :bookings, only: %i[destroy]
end
