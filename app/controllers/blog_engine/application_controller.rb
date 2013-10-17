class BlogEngine::ApplicationController < ApplicationController
  layout 'layouts/application'
  
  private  
    def authenticate_user
      redirect_to ('/signin') unless current_user
    end 
end
