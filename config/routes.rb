Rails.application.routes.draw do

  get 'search/search'
  root 'home#index'
  get 'home/about'

  devise_for :users
  resources :users
  resources :blogs do
    resources :favorites, only:[:create, :destroy]
  end
  resources :genres
  resources :comments, only:[:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
