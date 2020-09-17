Rails.application.routes.draw do
  devise_for :users
  root :to => 'home#top'
  get 'home/about' => 'home#about'
  resources :users, only: [:index, :show, :create, :edit, :update]
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
