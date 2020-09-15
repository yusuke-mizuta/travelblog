Rails.application.routes.draw do

  get 'admins/top'
  get 'search/search'
  root 'home#index'
  get 'home/about'
  get 'genres/admin_index'

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

  resources :users
  resources :admins
  resources :blogs do
    resources :favorites, only:[:create, :destroy]
  end
  resources :genres
  resources :comments, only:[:create, :destroy]
  resources :requests
  resources :messages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
