require_dependency "blog_engine/application_controller"

module BlogEngine
  class ArticlesController < ApplicationController
    before_filter :authenticate_user!, except: [:index, :show]
    
    def index
      @articles = Article.published
    end
    
    def show
      @article = Article.find(params[:id])
      @comment = @article.comments.build
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
    
    def edit
      @article = Article.find(params[:id])
    end
    
    def update
      @article = Article.create(article_params)
      if @article.save
        redirect_to(@article, notice: "Article has been saved")
      else
        render action: "edit"
      end
    end
    
    def destroy
      @article = Article.find(params[:id])
      @article.destroy
      redirect_to(articles_path, notice: "Article was deleted")
    end
    
    
    private
    
      def article_params
        params.require(:article).permit(:title, :content, :published)
      end
  end
end
