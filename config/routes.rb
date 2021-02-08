Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: :about

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get "mypage"
      get "confirm"
      patch "hide"
    end
  end

  resources :posts

end
