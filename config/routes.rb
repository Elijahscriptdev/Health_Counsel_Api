Rails.application.routes.draw do
  resources :users
  resources :appointments
  resources :doctors
  get 'user', to: 'users#index'
  post '/signup', to: 'users#create'
  post '/auth/login', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
