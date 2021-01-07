Rails.application.routes.draw do
  root to: "home#top"

  devise_for :users
  get "home/about" => "home#about"
  get 'search' => 'users#search'
  resources :books do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users do
    member do
      get :following_user, :follower_user
    end
  end

  # DM用
  resources :rooms, only: [:index, :create, :show]
  resources :messages, only: [:create, :edit, :update, :destroy]

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
end
