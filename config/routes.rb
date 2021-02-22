Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :dogs, only: %i[ index new create destroy ]
end
