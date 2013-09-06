Rails.application.routes.draw do

  mount BlogEngine::Engine => "/blog"
end
