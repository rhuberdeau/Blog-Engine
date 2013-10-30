BlogEngine::Engine.routes.draw do
  resources :articles do
    collection do
      put :publish
    end
  end
  get '/admin', to: "admin#index"
  root to: "articles#index"
end
