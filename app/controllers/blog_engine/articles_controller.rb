require_dependency "blog_engine/application_controller"

module BlogEngine
  class ArticlesController < ApplicationController
    
    def index
      @articles = Article.all
    end
    
    def show
      
    end
  end
end
