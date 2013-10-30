require "spec_helper"

describe BlogEngine::AdminController do
  include Devise::TestHelpers
  
  context "signed in" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in(user)
    end
    
    it "loads for authenticated users" do
      get 'index', use_route: 'blog_engine'
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
    
    it "responds with unpublished articles" do
      article1, article2 = BlogEngine::Article.create(title: "hello world", content: "how are you", published: true), BlogEngine::Article.create(title: "second post", content: "going ok so far", published: false)
      get 'index', use_route: 'blog_engine'

      expect(assigns(:articles)).not_to include(article1)
      expect(assigns(:articles)).to include(article2)
    end
  end
  
  context "not signed in" do
    it "redirects unauthenticated users" do
      get 'index', use_route: 'blog_engine'
      expect(response).to redirect_to('/signin')
    end
  end
end