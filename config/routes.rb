Rails.application.routes.draw do
  resources :measurements, only: [:index, :show, :create]
  resources :tasks, only: [:index]
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
