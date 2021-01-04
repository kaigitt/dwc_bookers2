Rails.application.routes.draw do
  root to: "home#top"
  devise_for :users
  get "home/about" => "home#about"
  resources :books do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users
end
