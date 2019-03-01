Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  resources :posts do
    resources :comments, module: :posts
  end

  resources :posts do
    resources :likes do

      member do
        get :delete
      end
    end
  end

  devise_for :users
  root 'pages#index'
  get '/home' => 'pages#home'
  get '/user/:id' => 'pages#profile', as: "user_profile"
  get '/explore' => 'pages#explore'


  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
