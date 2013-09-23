class BlogEngine::ApplicationController < ApplicationController
  layout 'layouts/application'
  
  private  
    def authenticate_user
      redirect_to ('/users/sign_in') unless current_user
    end 
end
