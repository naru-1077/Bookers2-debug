Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get "/home/about" => "homes#about"

  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy] do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]

  resources :users do
    get :following_user, on: :member
    get :follower_user, on: :member
  end

end