Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: :about

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :confirm
      patch :hide
      get :followings
      get :followers
      get :bookmarks
    end
  end

  post 'follow/:id' => 'relationships#follow', as: 'follow'
  delete 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    resource :bookmarks, only: [:create, :destroy]
    resource :votes, only: [:create, :destroy]
  end
  
  resources :tags do
    get 'posts', to: 'posts#search'
  end

end
