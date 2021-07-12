Rails.application.routes.draw do
  resources :microposts
  get 'sessions/new'
  post    "login"    => "sessions#create"
  delete  "logout"   => "sessions#destroy"
  root 'homes#index'
  resources :users
  resources :homes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
