require_dependency "blog_engine/application_controller"

module BlogEngine
  class ArticlesController < ApplicationController
    
    def index
      @articles = Article.published
    end
    
    def show
      @article = Article.find(params[:id])
      if @article.published == false
      	redirect_to('/blog')
      end
    end

    def new
      @article = Article.new
    end
  end
end
