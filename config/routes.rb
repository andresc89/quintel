Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'calculator#index'

  resources :calculator, only: [:index]
  # Defines the root path route ("/")
end
