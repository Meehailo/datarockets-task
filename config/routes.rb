Rails.application.routes.draw do
  devise_for :users
  get 'posts/index', as: 'user_root'

  resources :posts
end
