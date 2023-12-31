Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "posts#index"
  get 'about', to: 'pages#about', as: 'about'
  resources :posts

  get 'profiles/index', to: 'profiles#index', as: 'cabinet'
  get 'profiles/show/:id', to: 'profiles#show', as: 'profile'

end
