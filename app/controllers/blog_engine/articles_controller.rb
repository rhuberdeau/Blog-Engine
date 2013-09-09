require_dependency "blog_engine/application_controller"

module BlogEngine
  class ArticlesController < ApplicationController
    
    def index
      @articles = Article.published
    end
    
    def show
      @article = Article.find(params[:id])
      unless @article.published == true
      	redirect_to('/blog/articles')
      end
    end

    def new
      @article = Article.new
    end
    
    def create
      @article = Article.create(article_params)
      if @article.save
        redirect_to(@article, notice: "Article has been saved")
      else
        render action: "new"
      end
    end
    
    private
    
      def article_params
        params.require(:article).permit(:title, :content, :published)
      end
  end
end
