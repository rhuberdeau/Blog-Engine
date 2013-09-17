require_dependency "blog_engine/application_controller"

module BlogEngine
  class CommentsController < ApplicationController
    before_filter :authenticate_user!
    
    def show
    end

    def create
      @article = BlogEngine::Article.find(params[:article_id])
      @comment = @article.comments.build(comment_params)
      
      if @comment.save
        redirect_to(@article, notice: "Your comment has been created")
      else
        render 'articles/show', notice: "Please correct the errors and try again"
      end
    end
    
    private
    
    def comment_params
      params.require(:comment).permit(:content, :article_id)
    end
  end
end
