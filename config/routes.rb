Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    resources :orders, only: %i[create]
  end
  resources :orders, only: %i[index show update destroy] 
end
