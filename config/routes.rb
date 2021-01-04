Rails.application.routes.draw do
  root to: "home#top"

  devise_for :users
  get "home/about" => "home#about"
  resources :books do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users do
    member do
      get :following_user, :follower_user
  end
end
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
end
