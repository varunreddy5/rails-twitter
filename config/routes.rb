Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root 'pages#index'
  get '/home' => 'pages#home'
  get '/user/:id' => 'pages#profile'
  get '/explore' => 'pages#explore'

  resources :users do
    member do
      get :following, :followers
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
