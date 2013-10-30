require_dependency "blog_engine/application_controller"

module BlogEngine
  class AdminController < ApplicationController
    before_filter :authenticate_user
    
    def index
      @articles = Article.unpublished
    end
    
  end
end