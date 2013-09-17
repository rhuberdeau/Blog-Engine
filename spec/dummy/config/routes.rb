Rails.application.routes.draw do

  resources :posts

  devise_for :users
  mount BlogEngine::Engine => "/blog"
  root :to => "posts#index"
end
