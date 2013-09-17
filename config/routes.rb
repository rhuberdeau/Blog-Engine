BlogEngine::Engine.routes.draw do
  get "comments/show"
  get "comments/create"
  resources :articles do
    resources :comments
  end
  root to: "articles#index"
end
