Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'converter#index'

  resources :converter, only: [:index, :evolved]
  # Defines the root path route ("/")
end
