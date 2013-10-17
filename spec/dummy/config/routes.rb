Rails.application.routes.draw do

  resources :posts

  devise_for :users, :path => '', :path_names => {:sign_in => 'signin'}
  mount BlogEngine::Engine => "/blog"
  root :to => "posts#index"
end
