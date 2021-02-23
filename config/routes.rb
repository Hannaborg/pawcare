Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :dogs, only: %i[ index show new create destroy ] do
    resources :bookings, only: %i[ new create destroy]
  end

end
