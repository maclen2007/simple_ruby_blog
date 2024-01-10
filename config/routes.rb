Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "posts#index"

  get 'about', to: 'pages#about', as: 'about'
  get 'contact', to: 'pages#contact', as: 'contact'

  resources :posts

  get 'profiles/index', to: 'profiles#index', as: 'cabinet'
  get 'profiles/show/:id', to: 'profiles#show', as: 'profile'

  post 'send_form', to: 'pages#send_form', as: 'send_form'

end
